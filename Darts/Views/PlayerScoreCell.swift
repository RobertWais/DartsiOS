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
    var name: String = ""
    var number: Int = 0
    func configureCell(name: String, playerNumber: Int){
        playerName.text = name
        self.name = name
        self.number = playerNumber
        createButtons()
    }
    
    func createButtons(){
        
        //Divisions of 8 15,16,17,18,19,20,Bull,Score
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 20))
        btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
        btn.backgroundColor = UIColor.yellow
        btn.tag = 15
        self.addSubview(btn)
        
        
        
        
    }
    
    @objc func buttonTouched(sender: UIButton!){
        if sender.tag == 15 {
            print("Player: \(number) scored")
        }
    }
}
