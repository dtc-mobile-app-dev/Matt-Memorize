//
//  Themes.swift
//  Memorize
//
//  Created by His Dudeness on 7/21/21.
//

import SwiftUI

struct Themes {
    
    static let themes: [Int : Theme<String>] =
        [
            0: Theme.init(content: ["✈️", "🚀", "🚂", "🏎", "🛺", "🚜", "🛵", "🚟", "🚌", "🚕", "🚲", "🛴"], color: "red", themeName: "Vehicles", numberOfPairsOfCards: 10, id: 0),
            1: Theme.init(content: ["🍆", "🥦", "🧅", "🥔", "🌽", "🥕", "🫑", "🍅", "🧄", "🍠", "🥬", "🥒"], color: "green", themeName: "Veggies", numberOfPairsOfCards: 14, id: 1),
            2: Theme.init(content: ["⚽️", "🏈", "🎾", "⚾️", "🏐", "🏓", "🥍", "🥏", "🏀", "🏏", "🏒", "🤺"], color: "blue", themeName: "Sports", numberOfPairsOfCards: 12, id: 2),
            3: Theme.init(content: ["🥐", "🥯", "🍞", "🥖", "🥨", "🧇", "🥞", "🫓", "🥪", "🍕", "🍩", "🍪"], color: "yellow", themeName: "Delicious Bread", numberOfPairsOfCards: 12, id: 3),
            4: Theme.init(content: ["🎶", "🪘", "🪗", "🎷", "🎻", "🎺", "🎹", "🥁", "🎸", "🎤", "🎵", "🎼"], color: "orange", themeName: "Music", numberOfPairsOfCards: 12, id: 4),
            5: Theme.init(content: ["💽", "💾", "📞", "☎️", "📽", "📹", "📼", "📠", "📟", "🕹", "🖲", "💿"], color: "purple", themeName: "Tech", numberOfPairsOfCards: 12, id: 5)
        ]
}

