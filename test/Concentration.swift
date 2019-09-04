//
//  Concentration.swift
//  test
//
//  Created by ithinknet02 on 2019/9/4.
//  Copyright © 2019 zhangqiao. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 1...numberOfPairOfCards {
            let card = Card()
            cards += [card,card] //equal: cards.append(card).append(card)
        }
    }
}
