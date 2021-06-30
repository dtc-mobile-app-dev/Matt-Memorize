//
//  MemoryGame.swift
//  Memorize
//
//  Created by His Dudeness on 6/30/21.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        cards = Array<Card>()
//        add numberOfPairsPfCards x 2 cards to cards array
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
