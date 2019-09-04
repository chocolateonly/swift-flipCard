//
//  ViewController.swift
//  test
//
//  Created by ithinknet02 on 2019/9/3.
//  Copyright © 2019 zhangqiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   @IBOutlet weak var flipsLabel: UILabel!
    
    var flipsBtnNumber = 0 {
        didSet{
            print("flips btn number : \(flipsBtnNumber)")
            flipsLabel.text = "Flips: \(flipsBtnNumber)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    var emojiChoies = ["🤣","😎","🤣","😎"]

    @IBAction func btnClick(_ sender: UIButton) {
        print("agh!successfully!")
        flipsBtnNumber += 1
       //
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print(cardNumber)
            flipCard(withEmoji: emojiChoies[cardNumber], on: sender)
        }
        else{
            print("chosen button was not in cardButtons")
        }
    }
    func flipCard(withEmoji emoji: String,on button: UIButton){
        if(button.currentTitle == emoji){
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
    }
}

