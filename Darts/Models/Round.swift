//
//  Round.swift
//  Darts
//
//  Created by Robert Wais on 5/28/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

class Round: NSObject {
    
    var darts = [Dart]()
    
    
    init(first: Dart, second: Dart, third: Dart){
        darts.append(first)
        darts.append(second)
        darts.append(third)
    }
    
    override init(){
        
    }
    
    var marks: Int {
        var totalMarks = 0
        for dart in darts {
            totalMarks += dart.marks
        }
        return totalMarks
    }
    
    var score: Int {
        var totalScore = 0
        for dart in darts {
            totalScore += dart.totalDartScore()
        }
        return totalScore
    }
    
    func clearDart(removeDart: Dart){
        var index = 0
        for dart in darts {
            if dart.isEqual(removeDart){
                darts.remove(at: index)
            }
        index = index + 1
        }
    }
    
    func addDart(addDart: Dart){
        if darts.count > 3 { return }
        darts.append(addDart)
    }
}


