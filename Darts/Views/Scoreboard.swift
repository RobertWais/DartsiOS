//
//  Scoreboard.swift
//  Darts
//
//  Created by Robert Wais on 5/28/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class Scoreboard: UIView {

    var sections: Int = 0
    var slots = [UILabel]()
    var gameObject: DartGameObjectViewModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, numberOfSections: Int){
        super.init(frame: frame)
        self.sections = numberOfSections
        setTopRow()
        setBottomRow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setTopRow(){
        let seperator = self.frame.width/CGFloat(sections)
        for index in 0..<sections{
            let view = UILabel(frame: CGRect(x: seperator*CGFloat(index), y: 0, width: seperator, height: self.frame.height/2))
            if index == sections/2{
                // Center Cell
                view.text = "Score"
            }else{
                
                view.text = "12"
            }
            view.textAlignment = .center
            view.textColor = UIColor.white
            self.addSubview(view)
        }
    }
    
    
    //MPR for future use
    private func setBottomRowMPR(){
        let seperator = self.frame.width/CGFloat(sections)
        for index in 0..<sections{
            let view = UILabel(frame: CGRect(x: seperator*CGFloat(index), y: self.frame.height/2, width: seperator, height: self.frame.height/2))
            if index == sections/2{
                view.text = "MPR"
            }else{
                // Center Cell
                view.text = "12.99"
            }
            view.textAlignment = .center
            view.textColor = UIColor.white
            self.addSubview(view)
        }
    }
    
    private func setBottomRow(){
        let seperator = self.frame.width/3

        for index in 0..<3{
            let view = UILabel(frame: CGRect(x: seperator*CGFloat(index), y: self.frame.height/2, width: seperator, height: self.frame.height/2))
            view.text = "-"
            view.textAlignment = .center
            view.textColor = UIColor.white
            view.isUserInteractionEnabled = true
            slots.append(view)
            self.addSubview(view)
        }
    }
    
    func setValue(dart: Dart, index: Int){
        slots[index].text = "\(DartScratch.getStringRep(dart.type))\(dart.displayPoints)"
    }
    
    func removeValue(dart: Dart, index: Int){
        //**
        slots[index].text = "-"
    }
}
