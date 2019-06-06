//
//  Stat.swift
//  Darts
//
//  Created by Robert Wais on 6/6/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation
class Stat {
    
var score = 0
var mpr = 0.0
var dartScratches = DartScratches()

    init(score: Int, mpr: Double, scratches: DartScratches){
        self.score = score
        self.mpr = mpr
        self.dartScratches = scratches
        }
    
}
