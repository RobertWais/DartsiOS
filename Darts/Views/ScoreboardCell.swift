//
//  ScoreboardVC.swift
//  Darts
//
//  Created by Robert Wais on 5/26/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class ScoreboardCell: UICollectionViewCell, MultplierViewDelegate {
    
    
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var gameObject: DartGameObjectViewModel?
    var currentPopUpViews = [MultiplierView]()
    
    var points: [String] = ["20","19","18","17","16","15","Bull"]
    
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
            btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
            
            btn.layer.cornerRadius = btn.bounds.size.height/2;
            btn.layer.masksToBounds = true
            btn.backgroundColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1.0)
            
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.borderWidth = 2.0
            btn.setTitleColor(UIColor.black, for: UIControl.State.normal)

            btn.backgroundColor = UIColor.white
            if index%2 == 0 {
                //btn.backgroundColor = UIColor.white
            }
            
            let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(hold(recognizer:)))
            btn.addGestureRecognizer(gestureRecognizer)
            
            btn.tag = 15+(5-index)
            btn.setTitle("\(points[index])", for: .normal)
            self.addSubview(btn)
        }
    }
    
    @objc func buttonTouched(sender: UIButton!){
        let newDart = Dart(points: sender.tag, type: DartScratch.One)
        gameObject?.addDart(dart: newDart)
    }
    
    @objc func hold(recognizer: UILongPressGestureRecognizer){
        
        if(recognizer.state == UIGestureRecognizer.State.began){
            print("Count: \(currentPopUpViews.count)")
            if currentPopUpViews.count < 1 {
                let seperator = height/7
                print("Single\\Double\\Triple")
                
                let mulView = MultiplierView(frame: CGRect(x: 0, y: (recognizer.view?.frame.minY)!, width: width, height: seperator*2))
                mulView.tag = (recognizer.view?.tag)!
                self.clipsToBounds = false
                self.addSubview(mulView)
                mulView.animate()
                mulView.delegate = self
                currentPopUpViews.append(mulView)
            }
        }
    }
    
    func sendInfo(_ type: String, tag: Int) {
        print("Before Count: \(currentPopUpViews.count)")
        currentPopUpViews.removeAll()
        print("After: \(currentPopUpViews.count)")
        switch type {
        case "T":
            gameObject?.addDart(dart: Dart(points: tag, type: DartScratch.Three))
            break
        case "D":
            gameObject?.addDart(dart: Dart(points: tag, type: DartScratch.Two))
            break
        default:
            // Cancelled
            break
        }
    }
    
    
}
