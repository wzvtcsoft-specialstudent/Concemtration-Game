//
//  Card.swift
//  Cpmcemtration
//
//  Created by cc on 2019/4/28.
//  Copyright © 2019 cc. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int { return identifier}
    
    static func ==(lhs: Card, rhs: Card) ->Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var IsMatched = false
    private var identifier: Int
    
    private static var identifierFactiory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactiory += 1
        return identifierFactiory
    }
    
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
