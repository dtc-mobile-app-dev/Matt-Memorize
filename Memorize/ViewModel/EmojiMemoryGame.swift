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
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private(set) var theme: Theme<String>
    
    init() {
        theme = Themes.themes[EmojiMemoryGame.pickThemeId()]! //this assumes there is at least 1 entry in the Dict
        model = Self.createMemoryGame(theme: theme)
    }
    
    @Published private var model: MemoryGame<String>
    
    var score: Int {
        model.score
    }
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func newGame() {
        let theme = Themes.themes[EmojiMemoryGame.pickThemeId()]! //this also assumes that there is 1 entry in the Dict
        model = Self.createMemoryGame(theme: theme)
    }
    
    private static func pickThemeId() -> Int {
        let numChoices = Themes.themes.count
        return Int.random(in: 0..<numChoices)
    }
}
