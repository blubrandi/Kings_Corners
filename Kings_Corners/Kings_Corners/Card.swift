//
//  Card.swift
//  Kings_Corners
//
//  Created by Brandi Bailey on 6/4/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import Foundation
import UIKit

enum Suit {
    case Hearts, Diamonds, Clubs, Spades
}

enum Rank {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

class Card: NSObject {
    var rank: Rank
    var suit: Suit
    var value: Int
    var name: String
    var img: UIImage
    
    init(rank: Rank, suit: Suit, value: Int, name: String, img: UIImage) {
        self.rank = rank
        self.suit = suit
        self.value = value
        self.name = name
        self.img = img
    }
}
