//
//  DartGameObject.swift
//  Darts
//
//  Created by Robert Wais on 5/27/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

protocol DartsGame: class {
    func addDartScore()
    func removeDartScore()
    func nextRound()
    func updateStats(_ stats: Stats)
    func checkWinner()
}

class DartGameObjectViewModel: NSObject{
    
    //Create delegate
    weak var delegate: DartsGame?
    var players = [Player]()
    var currentPlayer: Player!
    var currRound = Round()
    
    var counter = 0
    
    init(players: [Player]){
        self.players = players
        currentPlayer = players[0]
    }
    
    
    func addDart(dart: Dart){
        currRound.addDart(addDart: dart)
        // Call back to add UI Dart Display
    }
    
    func removeDart(dart: Dart){
        currRound.clearDart(removeDart: dart)
        // Call back to remove UI Dart Display
        
        // Return all data back Score, MPR, Values - Crossed
        delegate?.removeDartScore()
    }
    
    func addRound(){
        currentPlayer.addRound(round: currRound)
        moveCurrPlayer()
        
        // Call back clear round display
        // Move highlighted player
    }
    
    func moveCurrPlayer(){
        currentPlayer = players[(1+counter)%3]
        counter = counter+1
    }
    
    func retrieveAllStats(){
        var score = [Int]()
        var mpr = [Double]()
        
        for index in 0..<players.count{
            score.append(players[index].getTotalScore())
            mpr.append(players[index].getTotalMarksPerRound())
        }
        delegate?.updateStats(Stats(score: score, mpr: mpr))
    }
    
    func checkWinner(){
        // Stop game, Modal Pop - Up confirming win, Close or keep playing
    }
    
}
