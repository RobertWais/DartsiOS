//
//  MultiplierView.swift
//  Darts
//
//  Created by Robert Wais on 6/6/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation
import UIKit

protocol MultplierViewDelegate: class {
    func sendInfo(_ type: String, tag: Int)
}

class MultiplierView: UIView {
    
    weak var delegate: MultplierViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5.0
        self.alpha = 0.0
        createButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
        }) { (success) in
        }
    }
    
    func createButtons(){
        let seperator = self.frame.height/3
        
        let tripleBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: seperator))
        tripleBtn.addTarget(self, action: #selector(triplePressed), for: .touchUpInside)
        
        tripleBtn.layer.borderColor = UIColor.black.cgColor
        tripleBtn.setTitleColor(UIColor.black, for: .normal)
        tripleBtn.setTitle("Triple", for: .normal)
        
        let doubleBtn = UIButton(frame: CGRect(x: 0, y: seperator, width: self.frame.width, height: seperator))
        doubleBtn.addTarget(self, action: #selector(doublePressed), for: .touchUpInside)
        
        doubleBtn.layer.borderColor = UIColor.black.cgColor
        doubleBtn.setTitleColor(UIColor.black, for: .normal)
        doubleBtn.setTitle("Double", for: .normal)
        
        let cancelBtn = UIButton(frame: CGRect(x: 0, y: seperator*2, width: self.frame.width, height: seperator))
        cancelBtn.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        
        cancelBtn.layer.borderColor = UIColor.black.cgColor
        cancelBtn.setTitleColor(UIColor.black, for: .normal)
        cancelBtn.setTitle("Close", for: .normal)
        
        self.addSubview(tripleBtn)
        self.addSubview(doubleBtn)
        self.addSubview(cancelBtn)
    }
    
    @objc func triplePressed(sender: UIButton!){
        print("Triple Pressed")
        delegate?.sendInfo("T", tag: self.tag)
        self.removeFromSuperview()
    }
    
    @objc func doublePressed(){
        print("Double Pressed")
        delegate?.sendInfo("D", tag: self.tag)
        self.removeFromSuperview()
    }
    
    @objc func cancelPressed(){
        print("Cancel Pressed")
        delegate?.sendInfo("X", tag: self.tag)
        self.removeFromSuperview()
    }
    
}
