//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by His Dudeness on 6/30/21.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "🍆"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { index in "🍆"}
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
