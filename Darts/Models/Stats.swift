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
    
    init(score: [Int], mpr: [Double]){
        self.score = score
        self.mpr = mpr
    }
}
