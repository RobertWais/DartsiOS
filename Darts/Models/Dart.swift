//
//  Dart.swift
//  Darts
//
//  Created by Robert Wais on 5/28/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

class Dart: NSObject {
    
    private var _points: Int = 0
    private var _type: DartScratch
    
    init(points: Int, type: DartScratch){
        self._points = points
        self._type = type
    }
    
    var marks: Int {
        return _type.rawValue
    }
    
    
    func totalDartScore()->Int{
        return _type.rawValue*points
    }
    
    var points: Int {
        return _points
    }
    
    var type: DartScratch {
        return _type
    }
}
