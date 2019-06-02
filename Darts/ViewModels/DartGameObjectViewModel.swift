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
    func updateIndyStats(score: Int, mpr: Double, scratches: DartScratches)
    func checkWinner()
}

class DartGameObjectViewModel: NSObject{
    
    //Create delegate
    weak var delegate: DartsGame?
    var players = [Player]()
    var currentPlayer: Player!
    
    var counter = 0
    
    init(players: [Player]){
        self.players = players
        currentPlayer = players[0]
    }
    
    
    func addDart(dart: Dart){
        currentPlayer.addToCurrentRound(dart: dart)
        // Call back to add UI Dart Display
    }
    
    func removeDart(dart: Dart){
        currentPlayer.removeDartFromCurrentRound(dart: dart)
        // Call back to remove UI Dart Display
        
        // Return all data back Score, MPR, Values - Crossed
        delegate?.removeDartScore()
    }
    
    func addRound(){
        currentPlayer.completeRound()
        moveCurrPlayer()
        
        // Call back clear round display
        // Move highlighted player
    }
    
    func moveCurrPlayer(){
        currentPlayer = players[(1+counter)%3]
        counter = counter+1
    }
    
    func retrieveCurrentStats(){
        // Add scratches
        delegate?.updateIndyStats(score: currentPlayer.getTotalScore(), mpr: currentPlayer.getTotalMarksPerRound(), scratches: currentPlayer.getScratches())
    }
    
    func checkWinner(){
        // Stop game, Modal Pop - Up confirming win, Close or keep playing
    }
    
    
    func retrieveAllStats(){
        var score = [Int]()
        var mpr = [Double]()
        var scratches = [DartScratches]()
        
        for index in 0..<players.count{
            score.append(players[index].getTotalScore())
            mpr.append(players[index].getTotalMarksPerRound())
            scratches.append(players[index].getScratches())
        }
        
        // Add scratches
        delegate?.updateStats(Stats(score: score, mpr: mpr, scratches: scratches))
    }
}

// Change so that players hold all the rounds
// Constantly adding to darts to a player
