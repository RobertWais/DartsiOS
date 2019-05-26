//
//  ScoreboardVC.swift
//  Darts
//
//  Created by Robert Wais on 5/26/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class ScoreboardCell: UICollectionViewCell {
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    func configureCell(score: String, width: CGFloat, height: CGFloat){
        self.width = width
        self.height = height
        createButtons()
    }
    
    func createButtons(){
        //Divisions of 8 15,16,17,18,19,20,Bull,Score
        
        let seperator = height/7
        
        for index in 0..<7 {
            let btn = UIButton(frame: CGRect(x: 0, y: CGFloat(index)*CGFloat(seperator), width: width, height: seperator))
            print("height: \(btn.frame.height)")
            print("y: \(btn.frame.minY)")
            btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
            btn.backgroundColor = UIColor.black
            if index%2 == 0 {
                btn.backgroundColor = UIColor.white
            }
            btn.tag = 15+index
            btn.setTitle("\(btn.tag)", for: .normal)
            self.addSubview(btn)
            
        }
    }
    
    @objc func buttonTouched(sender: UIButton!){
        print("Scoreboard: \(sender.tag)")
    }
}
