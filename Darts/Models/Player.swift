//
//  Player.swift
//  Darts
//
//  Created by Robert Wais on 5/26/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    var _name : String?
    var _number: Int?
    var _score: Int?
    var _mpr: Int?
    var _ppr: Int?
    
    var rounds = [Round]()
    
    init(name: String?, number: Int?, score: Int?, mpr: Int?, ppr: Int? ) {
        self._name = name
        self._number = number
        self._score = score
        self._mpr = mpr
        self._ppr = ppr
    }
    
    var name : String{
        guard let name = _name else{
            return ""
        }
        return name
    }
    
    var number: Int {
        guard let number = _number else {
            return 0
        }
        return number
    }
    
    var score: Int {
        guard let score = _score else {
            return getTotalScore()
        }
        return score
    }
    
    var mpr: Int {
        guard let mpr = _mpr else {
            return getTotalMarksPerRound()
        }
        return mpr
    }
    
    var ppr: Int {
        guard let ppr = _ppr else {
            return 0
        }
        return ppr
    }
    
    func addRound(round: Round){
        rounds.append(round)
    }
    
    func getTotalScore()->Int{
        var totalScore = 0
        for round in rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    func getTotalMarksPerRound()->Int{
        var totalMarksPerRound = 0
        for round in rounds {
            totalMarksPerRound += round.marks
        }
        return totalMarksPerRound/rounds.count
    }
    
}
