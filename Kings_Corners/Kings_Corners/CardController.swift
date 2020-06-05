//
//  CardController.swift
//  Kings_Corners
//
//  Created by Brandi Bailey on 6/4/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import Foundation
import UIKit

func createNewDeck() -> [Card] {
    
    let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
    let suits = [Suit.Hearts, Suit.Diamonds, Suit.Clubs, Suit.Spades]
    var cardValue = 0
    var deck: [Card] = []
    
    for rank in ranks {
        for suit in suits {
            let cardName = "\(rank) of \(suit)"
            let imgString = "\(rank)\(suit)"
            let cardImage = UIImage(named: imgString)
            
            if rank == Rank.Ace {
                cardValue = 1
            } else if rank == Rank.Two {
                cardValue = 2
            } else if rank == Rank.Three {
                cardValue = 3
            } else if rank == Rank.Four {
                cardValue =  4
            } else if rank == Rank.Five {
                cardValue = 5
            } else if rank == Rank.Six {
                cardValue = 6
            } else if rank == Rank.Seven {
                cardValue = 7
            } else if rank == Rank.Eight {
                cardValue = 8
            } else if rank == Rank.Nine {
                cardValue = 9
            } else {
                cardValue = 10
            }
             
            let card = Card(rank: rank, suit: suit, value: cardValue, name: cardName, img: cardImage!)
            
            deck.append(card)
        }
    }

    return deck.shuffled()
}
