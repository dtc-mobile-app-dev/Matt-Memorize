//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by His Dudeness on 6/30/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
//    private static let emojis1 = ["✈️", "🚀", "🚂", "🏎", "🛺", "🚜", "🛵", "🚟", "🚌", "🚕", "🚲", "🛴"]
//    private static let emojis2 = ["🍆", "🥦", "🧅", "🥔", "🌽", "🥕", "🫑", "🍅", "🧄", "🍠", "🥬", "🥒"]
//    private static let emojis3 = ["⚽️", "🏈", "🎾", "⚾️", "🏐", "🏓", "🥍", "🥏", "🏀", "🏏", "🏒", "🤺"]
//    private static let emojis4 = ["🥐", "🥯", "🍞", "🥖", "🥨", "🧇", "🥞", "🫓", "🥪", "🍕", "🍩", "🍪"]
//    private static let emojis5 = ["🎶", "🪘", "🪗", "🎷", "🎻", "🎺", "🎹", "🥁", "🎸", "🎤", "🎵", "🎼"]
//    private static let emojis6 = ["💽", "💾", "📞", "☎️", "📽", "📹", "📼", "📠", "📟", "🕹", "🖲", "💿"]
    
    private static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
        let emojis = theme.content.shuffled()
        let numberOfPairsOfCards = min(theme.numberOfPairsOfCards, emojis.count)
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
