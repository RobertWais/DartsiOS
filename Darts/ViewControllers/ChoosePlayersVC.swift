//
//  ChoosePlayersVC.swift
//  Darts
//
//  Created by Robert Wais on 5/16/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class ChoosePlayersVC: UIViewController {

    @IBOutlet weak var numberOfPlayersField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PlayBtnPressed(_ sender: Any) {
        let someNum: Int?
        
        guard let textToInt = numberOfPlayersField.text else {
            return
        }
        someNum = Int(textToInt)
        if let someNum = someNum{
            //
            let gameBoard = GameBoardVC()
            gameBoard.numberOfPlayers = someNum
            self.show(gameBoard, sender: self)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
