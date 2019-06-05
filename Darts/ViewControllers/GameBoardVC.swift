//
//  ViewController.swift
//  Darts
//
//  Created by Robert Wais on 5/16/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

protocol gameProtocol: class {
    
}
class GameBoardVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    var numberOfPlayers = 4;
    var numberOfSections = 0;
    var emptyCell = -1;
    var insets: CGFloat = 5;
    
    var collectionView: UICollectionView?
    var playerNames: UIView?
    var scoreBoard: Scoreboard?
    var nextBtn: UIButton?
    var deleteBtn: UIButton?
    var players = [Player]()
    
    var gameObject: DartGameObjectViewModel?

    //@IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPlayers()
        gameObject = DartGameObjectViewModel(players: players)
        gameObject?.delegate = self
        //GetNumberOfSections
        getNumberOfSections()
        //Collection View takes a third of the screen
        initCV()
        //Player names take up a 12th of the screen
        initAllOthers()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createPlayers(){
        for index in 0..<4{
            let player = Player(name: "Player \(index)", number: index)
            players.append(player)
        }
    }

    // MARK: Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case numberOfSections/2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScoreboardCell", for: indexPath)  as! ScoreboardCell
            cell.gameObject = gameObject
            cell.configureCell(score: "--Score--", width: widthOfCell(), height: heightOfCell())
            return cell
        case emptyCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCell", for: indexPath)  as! EmptyCell
            cell.configureCell()
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerScoreCell", for: indexPath)  as! PlayerScoreCell
            cell.configureCell(name: "Play: \(indexPath.row)", playerNumber: indexPath.row, width: widthOfCell(), height: heightOfCell())
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return divisionOfScreenForScoreboard()
    }
    
    func initCV(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: view.frame.height/12, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
        guard let cv = collectionView else{
            return
        }
        setAppearance()
        setDelegates()
        registerNibs()
        view.addSubview(cv)
    }
    
    func registerNibs(){
        collectionView?.register(UINib(nibName: "PlayerScoreCell", bundle: nil), forCellWithReuseIdentifier: "PlayerScoreCell")
        collectionView?.register(UINib(nibName: "ScoreboardCell", bundle: nil), forCellWithReuseIdentifier: "ScoreboardCell")
        collectionView?.register(UINib(nibName: "EmptyCell", bundle: nil), forCellWithReuseIdentifier: "EmptyCell")

    }
    
    func setDelegates(){
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func setAppearance(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.sectionInset = UIEdgeInsets(top: 0, left: insets, bottom: 0, right: insets)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.black
    }
    
    // MARK: Dimensions
    
    // Returns the size of each cell to be displayed
    // equally on the screen
    func divisionOfScreenForScoreboard()->CGSize{
        return CGSize(width: widthOfCell(), height: heightOfCell())
    }
    
    // Returns width of a player cell
    func widthOfCell()->CGFloat{
        guard let cv = collectionView else{
            return 0
        }
        return (cv.frame.width-insets*2)/CGFloat(numberOfSections)
    }
    
    // Returns height of a player cell
    func heightOfCell()->CGFloat{
        guard let cv = collectionView else{
            return 0
        }
        // The score takes 2/3 of the screen up
        return (cv.frame.height)/3*2
    }
    
    //MARK: Players
    
    
    
    private func getNumberOfSections(){
        if numberOfPlayers % 2 == 0 {
            // ex 1 2 score 3 4
            numberOfSections = numberOfPlayers + 1
        } else {
            // ex 1 2 score 3 (blank)
            numberOfSections = numberOfPlayers + 2
            emptyCell = numberOfSections - 1
        }
    }
    
}

// Other UI Updates not concerning Collection View
extension GameBoardVC {
    
    private func initAllOthers(){
        initPlayerNames()
        initNextBtn()
        initScoreboard()
    }
    private func initPlayerNames(){
        playerNames = PlayerNameCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/12), numberOfSections: numberOfSections)
        guard let players = playerNames else {
            // Throw error
            return
        }
        view.addSubview(players)
    }
    
    private func initNextBtn(){
        nextBtn = UIButton(frame: CGRect(x: 0, y: view.frame.height-(view.frame.height/12), width: (view.frame.width/4)*3, height: view.frame.height/12))
        guard let btn = nextBtn else {return}
        
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("Next Round", for: .normal)
        view.addSubview(btn)
        
        deleteBtn = UIButton(frame: CGRect(x: (view.frame.width/4)*3, y: view.frame.height-(view.frame.height/12), width: view.frame.width/4, height: view.frame.height/12))
        guard let dbtn = deleteBtn else {return}
        
        dbtn.backgroundColor = UIColor.black
        dbtn.setTitleColor(UIColor.white, for: .normal)
        dbtn.setTitle("x", for: .normal)
        dbtn.addTarget(self, action: #selector(deleteBtnPressed(sender:)), for: .touchUpInside)
        view.addSubview(dbtn)
    }
    
    @objc func deleteBtnPressed(sender: UIButton!){
        gameObject?.removeDart()
    }
    
    private func initScoreboard(){
        scoreBoard = Scoreboard(frame:  CGRect(x: 5, y: (view.frame.height/12)*9, width: view.frame.width-10, height: (view.frame.height/12)*2), numberOfSections: numberOfSections)
        scoreBoard?.gameObject = gameObject
        guard let score = scoreBoard else { return }
        view.addSubview(score)
    }
}

extension GameBoardVC: DartsGame{
    
    func addDartScore(dart: Dart, index: Int) {
        scoreBoard?.setValue(dart: dart, index: index)
    }
    
    func removeDartScore(dart: Dart, index: Int) {
        scoreBoard?.removeValue(dart: dart, index: index)
    }
    
    func nextRound() {
        
    }
    
    func updateStats(_ stats: Stats) {
        
    }
    
    func updateIndyStats(score: Int, mpr: Double, scratches: DartScratches) {
        
    }
    
    func checkWinner() {
        
    }
}
