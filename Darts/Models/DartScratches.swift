//
//  DartScratches.swift
//  Darts
//
//  Created by Robert Wais on 6/1/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

class DartScratches {
    
    // 20 19 18 17 16 15 Bull
    var scratches = [DartScratch.None,DartScratch.None,DartScratch.None,
                     DartScratch.None,DartScratch.None,DartScratch.None,
                     DartScratch.None]
    
    init(){
        //EMPTY to begin with
    }
    
    
    private func getIndex(value: Int)->Int{
        // Check for Bull
        if(value == 25) {return 6}
        
        return 20 - value
    }
    
    func addScratch(dart: Dart){
        // Darts with score less than 15 will not add scratches
        if dart.points < 15 { return }
        
        let index = getIndex(value: dart.points)
        
        let dartScratch = DartScratch.getValue(dart: dart)
        scratches[index] = DartScratch.addValue(firstScratch: dartScratch, secondScratch: scratches[index])
    }
    //Take in Number and Letter and add or remove scratches
}
