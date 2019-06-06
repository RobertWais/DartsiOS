//
//  DartScratch.swift
//  Darts
//
//  Created by Robert Wais on 6/1/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

enum DartScratch: Int { 
        case None = 0
        case One
        case Two
        case Three
    
    static func addValue(firstScratch: DartScratch, secondScratch: DartScratch)->DartScratch{
        let value = firstScratch.rawValue + secondScratch.rawValue
        
        switch value {
        case 0:
            return DartScratch.None
        case 1:
            return DartScratch.One
        case 2:
            return DartScratch.Two
        case 3:
            return DartScratch.Three
        default:
            return DartScratch.Three
        }
    }
    
    static func getValue(dart: Dart)->DartScratch{
        switch dart.marks {
        case 1:
            return DartScratch.One
        case 2:
            return DartScratch.Two
        case 3:
            return DartScratch.Three
        default:
            return DartScratch.None
        }
    }
    
    static func getStringRep(_ dartScratch: DartScratch)->String{
        switch dartScratch {
        case DartScratch.None:
            return "Non"
        case DartScratch.One:
            return "S"
        case DartScratch.Two:
            return "D"
        case DartScratch.Three:
            return "T"
        }
    }
}
