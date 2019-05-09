//
//  ViewController.swift
//  Cpmcemtration
//
//  Created by cc on 2019/4/26.
//  Copyright © 2019 cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game:Concentration = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    
    private(set) var flipCount = 0 {
        didSet {
            // flipCountLabel.text = "Flips: \(flipCount)"  使用update中的NSAttributedStringkKey 注释
            updateFilpCountLabel()
        }
    }
    
    private func updateFilpCountLabel() {
        let attrivutes: [NSAttributedString.Key:Any] = [
            .strokeWidth : 5.0,
        ]
        
        let attributeString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attrivutes)
        flipCountLabel.attributedText = attributeString
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFilpCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let carNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: carNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel()  {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor  = card.IsMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    //private var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎", "👀", "🐼", "🐔", "🚒", "❤️"]
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎👀🐼🐔🚒❤️"
    
    
    private var emoji =  Dictionary<Card,String>() //字典的特殊语法糖  var emoji = [INt:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil , emojiChoices.count > 0{
            
            //let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))  //extension Int 的使用使其可以省略
            //                emoji[card] = emojiChoices.remove(at: emojiChoices.count.arcrandom)   emojiChoices 变成字符串类型 所以这句注释
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arcrandom)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arcrandom: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

