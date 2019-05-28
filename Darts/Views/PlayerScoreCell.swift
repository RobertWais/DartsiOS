//
//  PlayerBoardCVCell.swift
//  Darts
//
//  Created by Robert Wais on 5/16/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class PlayerScoreCell: UICollectionViewCell {
    
    @IBOutlet weak var playerName: UILabel!
    
    //Stages [String]
    var name: String = ""
    var number: Int = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    func configureCell(name: String, playerNumber: Int, width: CGFloat, height: CGFloat){
        playerName.text = name
        self.width = width
        self.height = height
        self.name = name
        self.number = playerNumber
        
        self.backgroundColor = UIColor.black
        self.layer.cornerRadius = self.bounds.size.width/2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        createLbls()
    }
    
    //Divisions of 8 15,16,17,18,19,20,Bull,Score
    func createLbls(){
        let seperator = height/7
        for index in 0..<7{
            let lbl = UILabel(frame: CGRect(x: 0, y: CGFloat(index)*CGFloat(seperator), width: width, height: seperator))

//            if index==0 || index == 6 {
//                lbl.layer.cornerRadius = lbl.bounds.size.height/2;
//                lbl.layer.masksToBounds = true
//            }
//            lbl.backgroundColor = UIColor.black
//            lbl.layer.borderColor = UIColor.white.cgColor
//            lbl.layer.borderWidth = 2.0
            
            lbl.tag = 15+index
            
            lbl.textAlignment = NSTextAlignment.center
            lbl.textColor = UIColor.white
            lbl.text = "-"
            self.addSubview(lbl)
        }
    }
}
