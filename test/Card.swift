//
//  Card.swift
//  test
//
//  Created by ithinknet02 on 2019/9/4.
//  Copyright © 2019 zhangqiao. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
