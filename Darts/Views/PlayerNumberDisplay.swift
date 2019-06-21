//
//  PlayerNumberDisplay.swift
//  Darts
//
//  Created by Robert Wais on 6/19/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation
import UIKit

class PlayerNumberDisplay: UIView {
    
    let font =  UIFont(name: "GillSans-Bold", size: 30)

    var lbl = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        createDisplay();
        setPlayerLbl()
    }
    
    // Create UISegmentControl for players to choose how many players they want
    private func createDisplay(){
        
        let segment = UISegmentedControl(frame: CGRect(x: 0, y: self.frame.height/2, width: self.frame.width, height: self.frame.height/2))
        
        segment.tintColor = UIColor.white
        
        // [ 1, 2, 3, 4]
        segment.insertSegment(withTitle: "1", at: 0, animated: false)
        segment.insertSegment(withTitle: "2", at: 1, animated: false)
        segment.insertSegment(withTitle: "3", at: 2, animated: false)
        segment.insertSegment(withTitle: "4", at: 3, animated: false)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)

        
        // Default the UISegmented Control to highlight 2 playerss
        segment.selectedSegmentIndex = 1
        self.addSubview(segment)
    }
    
    private func setPlayerLbl(){
        lbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2))
        lbl.text = "Players"
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "GillSans-Bold", size: 40)
        //lbl.font = lbl.font.withSize(40)
        self.addSubview(lbl)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
