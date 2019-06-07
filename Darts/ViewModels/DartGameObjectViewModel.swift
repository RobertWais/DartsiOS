//
//  DartGameObject.swift
//  Darts
//
//  Created by Robert Wais on 5/27/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation

protocol DartsGame: class {
    func addDartScore(dart: Dart, index: Int)
    func retrieveScratches(_ dartScratches: DartScratches, name: String)
    func removeDartScore(dart: Dart, index: Int)
    func nextRound()
    func updateStats(_ stat: Stat)
    func updateIndyStats(stat: Stat, name: String, index: Int)
    func checkWinner()
}

class DartGameObjectViewModel: NSObject{
    
    //Create delegate
    weak var delegate: DartsGame?
    var players = [Player]()
    
    var currentPlayer: Player!
    var closedNumbers = [false, false, false, false, false, false, false]
    var closedPlayers = [Bool]()
    
    var counter = 0
    
    init(players: [Player]){
        super.init()
        self.players = players
        currentPlayer = players[0]
        createClosedPlayers()
    }
    
    func createClosedPlayers(){
        for _ in 0..<players.count {
            closedPlayers.append(false)
        }
    }
    
    func addDart(dart: Dart){
        let indexOfDart = currentPlayer.currentIndexOfDart()
        // Check if dart should score
        if !closedNumbers[20 - dart.points] && currentPlayer.getScratches().value[20-dart.points] == DartScratch.Three{
            dart.scored = true
        }
        if indexOfDart < 3 {
            currentPlayer.addToCurrentRound(dart: dart)
            delegate?.addDartScore(dart: dart, index: indexOfDart)
            delegate?.updateIndyStats(stat: Stat(score: currentPlayer.getTotalScore(), mpr: currentPlayer.getTotalMarksPerRound(), scratches: currentPlayer.getScratches()), name: currentPlayer.name, index: (counter%players.count))
        }
        checkClosedValue()
        checkWinner()
        // Call back to add UI Dart Display
    }
    
    func removeDart(){
        if currentPlayer.currentIndexOfDart() == 0 { return }
        let dart = currentPlayer.currRound.darts[currentPlayer.currentIndexOfDart()-1]
        currentPlayer.removeDartFromCurrentRound(dart: dart)
        delegate?.removeDartScore(dart: dart, index: currentPlayer.currentIndexOfDart())
        delegate?.updateIndyStats(stat: Stat(score: currentPlayer.getTotalScore(), mpr: currentPlayer.getTotalMarksPerRound(), scratches: currentPlayer.getScratches()), name: currentPlayer.name, index: (counter%players.count))
        checkClosedValue()
        checkWinner()
    }
    
    func addRound(){
        // If their aren't 3 darts don't go ahead
        if currentPlayer.currentIndexOfDart() == 3 {
            currentPlayer.completeRound()
            moveCurrPlayer()
            delegate?.nextRound()
        }else{
            print("Haven't scored all darts yet")
        }
        
        
        // Call back clear round display
        // Move highlighted player
    }
    
    func moveCurrPlayer(){
        currentPlayer = players[(1+counter)%players.count]
        counter = counter+1
        //Update UI
    }
    
    func retrieveCurrentStats(){
        // Add scratches
        
    }
    
    func checkWinner(){
        // Stop game, Modal Pop - Up confirming win, Close or keep playing
        if currentPlayer.allClosed() {
            // And has highest score
            print(" Winner ")
        }
//        for player in closedPlayers {
//            if player = true {
//                print("Winner")
//            }
//        }
    }
    
    func checkClosedValue(){
        for index in 0..<7{
            for player in players {
                if player.getScratches().value[index] != DartScratch.Three {
                    closedNumbers[index] = false
                    break
                }
                closedNumbers[index] = true
            }
        }
    }
    
    
    func retrieveAllStats(){
//        var score = [Int]()
//        var mpr = [Double]()
//        var scratches = [DartScratches]()
//
//        for index in 0..<players.count{
//            score.append(players[index].getTotalScore())
//            mpr.append(players[index].getTotalMarksPerRound())
//            scratches.append(players[index].getScratches())
//        }
//
//        // Add scratches
//        delegate?.updateStats(Stat(score: score, mpr: mpr, scratches: scratches))
    }
}

// Change so that players hold all the rounds
// Constantly adding to darts to a player
