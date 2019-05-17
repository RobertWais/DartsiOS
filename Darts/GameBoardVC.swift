//
//  ViewController.swift
//  Darts
//
//  Created by Robert Wais on 5/16/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class GameBoardVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    var numberOfPlayers = 0;


    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerScoreCell", for: indexPath) as! PlayerBoardCVCell
        
        cell.backgroundColor = UIColor.blue
        cell.configureCell(name: "Bob", height: collectionView.frame.height/3*2, width: collectionView.frame.width/4)
        return cell
    }
    
}
