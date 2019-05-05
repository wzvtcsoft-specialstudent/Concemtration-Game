//
//  Concentration.swift
//  Cpmcemtration
//
//  Created by cc on 2019/4/28.
//  Copyright © 2019 cc. All rights reserved.
//

import Foundation

class Concentration{
    
    private(set) var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)  {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chose index not in the cards")
        if !cards[index].IsMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 匹配成功
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].IsMatched = true
                    cards[index].IsMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //没有卡片朝上或者两张不匹配的卡片朝上
                for filpDownIndex in cards.indices {
                    cards[filpDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
            
        }
    }
}
