//
//  ChoosePlayersVC.swift
//  Darts
//
//  Created by Robert Wais on 5/16/19.
//  Copyright © 2019 Robert Wais. All rights reserved.
//

import UIKit

class ChoosePlayersVC: UIViewController {

    var playBtn: UIButton?
    var playerNumberDisplay: PlayerNumberDisplay?
    
    @IBOutlet weak var numberOfPlayersField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNumberDisplay = PlayerNumberDisplay(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.height/5)*2))
        view.addSubview(playerNumberDisplay!);
        createButton()
        
    }
    
    func createButton(){
        playBtn = UIButton(frame: CGRect(x: 0, y: ((view.frame.height/5)*4), width: view.frame.width, height: (view.frame.height/5)))
        playBtn?.backgroundColor = UIColor.white
        playBtn?.setTitle("Play", for: .normal)
        playBtn?.setTitleColor(UIColor.black, for: .normal)
        playBtn?.titleLabel!.font =  UIFont(name: "GillSans-Bold", size: 40)
        view.addSubview(playBtn!)
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
