//
//  PlayerNameCells.swift
//  Darts
//
//  Created by Robert Wais on 5/27/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class PlayerNameCell: UIView{
    
    var sections: Int = 0
    var lbls = [UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, numberOfSections: Int){
        super.init(frame: frame)
        self.sections = numberOfSections
        createLbls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createLbls(){
        let seperator = self.frame.width/CGFloat(sections)
        for index in 0..<sections{
            if index != sections/2{
                let lbl = UILabel(frame: CGRect(x: CGFloat(index)*CGFloat(seperator), y: 0 , width: self.frame.width/CGFloat(sections), height: self.frame.height))
                lbl.textColor = UIColor.white
                lbl.text = "Player: \(index)"
                lbl.textAlignment = NSTextAlignment.center
                lbls.append(lbl)
                self.addSubview(lbl)
            }
        }
    }
    
    func setCurrent(index: Int){
        for lbl in lbls {
            lbl.textColor = UIColor.white
            lbl.backgroundColor = UIColor.black
            lbl.textAlignment = NSTextAlignment.center
//            lbls[index].layer.cornerRadius = 0
//            lbls[index].layer.masksToBounds = false
        }
        
        lbls[index].textColor = UIColor.black
        lbls[index].backgroundColor = UIColor.white
        lbls[index].layer.cornerRadius = lbls[index].frame.height/2
        lbls[index].layer.masksToBounds = true
    }
}
