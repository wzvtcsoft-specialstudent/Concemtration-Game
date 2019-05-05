//
//  Card.swift
//  Cpmcemtration
//
//  Created by cc on 2019/4/28.
//  Copyright © 2019 cc. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var IsMatched = false
    var identifier: Int
    
    private static var identifierFactiory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactiory += 1
        return identifierFactiory
    }
    
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
