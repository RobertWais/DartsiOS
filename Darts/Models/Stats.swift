//
//  Stats.swift
//  Darts
//
//  Created by Robert Wais on 6/1/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

class Stats{
    
    var score = [Int]()
    var mpr = [Double]()
    var dartScratches = [DartScratches]()
    
    init(score: [Int], mpr: [Double], scratches: [DartScratches]){
        self.score = score
        self.mpr = mpr
        self.dartScratches = scratches
    }
}
