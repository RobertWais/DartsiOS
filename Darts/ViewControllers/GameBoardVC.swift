//
//  ViewController.swift
//  Darts
//
//  Created by Robert Wais on 5/16/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class GameBoardVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var numberOfPlayers = 0;
    var numberOfSections = 0;
    var insets: CGFloat = 5;
    var collectionView: UICollectionView?

    //@IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initCV()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // get the center for scoreboard
        if numberOfPlayers % 2 == 0 {
            // ex 1 2 score 3 4
            numberOfSections = numberOfPlayers + 1
            return numberOfSections
        } else {
            // ex 1 2 score 3 (blank)
            numberOfSections = numberOfPlayers + 2
            return numberOfSections
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == (numberOfSections/2) {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScoreboardCell", for: indexPath)  as! ScoreboardCell
            cell.configureCell(score: "--Score--", width: widthOfCell(), height: heightOfCell())
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerScoreCell", for: indexPath)  as! PlayerScoreCell
        cell.configureCell(name: "Player: \(indexPath.row)", playerNumber: indexPath.row)
        return cell
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
        // 1/3 of height
        return (cv.frame.height)/3*2
    }
    
    
    func initCV(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        setAppearance()
        setDelegates()
        registerNibs()
        view.addSubview(collectionView!)
    }
    
    func registerNibs(){
        collectionView?.register(UINib(nibName: "PlayerScoreCell", bundle: nil), forCellWithReuseIdentifier: "PlayerScoreCell")
        collectionView?.register(UINib(nibName: "ScoreboardCell", bundle: nil), forCellWithReuseIdentifier: "ScoreboardCell")
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
        
        collectionView?.backgroundColor = UIColor.blue
    }
    
}
