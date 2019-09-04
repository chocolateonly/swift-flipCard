//
//  ViewController.swift
//  test
//
//  Created by ithinknet02 on 2019/9/3.
//  Copyright © 2019 zhangqiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //cardButtons.count!!! add lazy const
   lazy var game: Concentration = Concentration(numberOfPairOfCards: cardButtons.count / 2)
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    

   @IBOutlet weak var flipsLabel: UILabel!
    
    var flipsBtnNumber = 0 {
        didSet{
            flipsLabel.text = "Flips: \(flipsBtnNumber)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    

    @IBAction func btnClick(_ sender: UIButton) {
        flipsBtnNumber += 1
       
        if let cardNumber = cardButtons.firstIndex(of: sender){
            //print(cardNumber)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("chosen button was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        //print("cardButtons.indices:\(cardButtons.indices)")
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoies = ["🤣","😍","🥳","😎","🥶","😈","🐶","👻"]
    var emoji = Dictionary<Int,String>()
    func emoji(for card: Card)-> String {
        if emoji[card.identifier] == nil,emojiChoies.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoies.count)))
            emoji[card.identifier] = emojiChoies.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

}

