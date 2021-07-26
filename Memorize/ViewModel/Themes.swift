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
            0: Theme.init(content: ["✈️", "🚀", "🚂", "🏎", "🛺", "🚜", "🛵", "🚟", "🚌", "🚕", "🚲", "🛴"], color: "red", themeName: "Vehicles", numberOfPairsOfCards: 10),
            1: Theme.init(content: ["🍆", "🥦", "🧅", "🥔", "🌽", "🥕", "🫑", "🍅", "🧄", "🍠", "🥬", "🥒"], color: "green", themeName: "veggies", numberOfPairsOfCards: 14),
            2: Theme.init(content: ["⚽️", "🏈", "🎾", "⚾️", "🏐", "🏓", "🥍", "🥏", "🏀", "🏏", "🏒", "🤺"], color: "blue", themeName: "Sports", numberOfPairsOfCards: 12),
            3: Theme.init(content: ["🥐", "🥯", "🍞", "🥖", "🥨", "🧇", "🥞", "🫓", "🥪", "🍕", "🍩", "🍪"], color: "yellow", themeName: "Delicious Bread", numberOfPairsOfCards: 12),
            4: Theme.init(content: ["🎶", "🪘", "🪗", "🎷", "🎻", "🎺", "🎹", "🥁", "🎸", "🎤", "🎵", "🎼"], color: "orange", themeName: "Music", numberOfPairsOfCards: 12),
            5: Theme.init(content: ["💽", "💾", "📞", "☎️", "📽", "📹", "📼", "📠", "📟", "🕹", "🖲", "💿"], color: "purple", themeName: "Tech", numberOfPairsOfCards: 12)
        ]
}

//    if ContentCount <= numberOfPairsOfCards {
//        return pairsOfCards == ContentCount
//    }


