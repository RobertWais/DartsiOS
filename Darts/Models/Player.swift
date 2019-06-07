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
    var _mpr: Double?
    var _ppr: Int?
    
    var scratches = DartScratches()
    var rounds = [Round]()
    var currRound = Round()
    
    init(name: String?, number: Int?, score: Int?, mpr: Double?, ppr: Int? ) {
        self._name = name
        self._number = number
        self._score = score
        self._mpr = mpr
        self._ppr = ppr
    }
    
    init(name: String?, number: Int?){
        self._name = name
        self._number = number
        self._score = 0
        self._mpr = 0.0
        self._ppr = 0
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
    
    var mpr: Double {
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
    
    func currentIndexOfDart()->Int{
        return currRound.darts.count
    }
    
    func addToCurrentRound(dart: Dart){
        print("Bull happening")
        currRound.addDart(addDart: dart)
    }
    
    func removeDartFromCurrentRound(dart: Dart){
        currRound.clearDart(removeDart: dart)
    }
    
    func completeRound(){
        addRound()
        currRound.clearRound()
    }
    
    private func addRound(){
        // Change later, quick fix
        let newEntry = Round(first: currRound.darts[0], second: currRound.darts[1], third: currRound.darts[2])
        rounds.append(newEntry)
    }
    
    func getTotalScore()->Int{
        var totalScore = 0
        for round in rounds {
            totalScore += round.score
        }
        return totalScore + currRound.score
    }
    
    func getTotalMarksPerRound()->Double{
        var totalMarksPerRound = 0
        for round in rounds {
            totalMarksPerRound += round.marks
        }
        return Double(totalMarksPerRound + currRound.marks)/Double(rounds.count + 1)
    }
    
    //  Computes the scratch board for the player
    func getScratches()->DartScratches{
        let dartScratches = DartScratches()
        
        // Add scratches from previous rounds
        for round in rounds {
            dartScratches.addScratch(dart: round.darts[0])
            dartScratches.addScratch(dart: round.darts[1])
            dartScratches.addScratch(dart: round.darts[2])
        }
        
        // Add scratches from current round
        for index in 0..<currRound.darts.count{
            dartScratches.addScratch(dart: currRound.darts[index])
        }
        return dartScratches
    }
    
    //  Checks to see if the player has closed all values
    func allClosed()->Bool {
        let allScratches = getScratches().value
        
        for index in 0..<allScratches.count {
            if allScratches[index] != DartScratch.Three {
                return false
            }
        }
        return true
    }
    
    // Debugging function to see the history of darts for
    // and individual player
    func getHistory(){
//        var count = 0
//        for round in rounds {
//            print(" Round: \(count)")
//            for dart in round.darts {
//                print(" Dart: \(dart.points)")
//            }
//        }
    }
}
