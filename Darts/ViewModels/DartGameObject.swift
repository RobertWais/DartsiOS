//
//  DartGameObject.swift
//  Darts
//
//  Created by Robert Wais on 5/27/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import Foundation



class DartGameObjectViewModel: NSObject{
    
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
    
    func checkWinner(){
        // Stop game, Modal Pop - Up confirming win, Close or keep playing
    }
    
}
