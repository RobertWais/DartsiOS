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

    //@IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GetNumberOfSections
        getNumberOfSections()
        //Collection View takes a third of the screen
        initCV()
        //Player names take up a 12th of the screen
        initPlayerNames()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case numberOfSections/2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScoreboardCell", for: indexPath)  as! ScoreboardCell
            cell.configureCell(score: "--Score--", width: widthOfCell(), height: heightOfCell())
            return cell
        case emptyCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCell", for: indexPath)  as! EmptyCell
            cell.configureCell()
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerScoreCell", for: indexPath)  as! PlayerScoreCell
            cell.configureCell(name: "Player: \(indexPath.row)", playerNumber: indexPath.row, width: widthOfCell(), height: heightOfCell())
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return divisionOfScreenForScoreboard()
    }
    
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
    
    func initPlayerNames(){
        playerNames = PlayerNameCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/12), numberOfSections: numberOfSections)
        guard let players = playerNames else {
            // Throw error
            return
        }
        view.addSubview(players)
        
    }
    
    func getNumberOfSections(){
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