//
//  Dart.swift
//  Darts
//
//  Created by Robert Wais on 5/28/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

class Dart: NSObject {
    
    private var points: Int = 0
    private var type: Character = "S"
    
    init(points: Int, type: Character){
        self.points = points
        self.type = type
    }
    
    var marks: Int {
        switch type {
        case "S":
            return 1
        case "D":
            return 2
        case "T":
            return 3
        default:
            return 0
        }
    }
    
    
    func totalDartScore()->Int{
        switch type {
        case "S":
            return 1*points
        case "D":
            return 2*points
        case "T":
            return 3*points
        default:
            return 0
        }
    }
}
