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
            0: Theme.init(content: ["✈️", "🚀", "🚂", "🏎", "🛺", "🚜", "🛵", "🚟", "🚌", "🚕", "🚲", "🛴"], color: RGBAColor(red: 1.0, green: 0.0, blue: 0.0,alpha: 1.0), themeName: "Vehicles", pairsOfCards: 10, id: 0),
            1: Theme.init(content: ["🍆", "🥦", "🧅", "🥔", "🌽", "🥕", "🫑", "🍅", "🧄", "🍠", "🥬", "🥒"], color: RGBAColor(red: 0.0, green: 1.0, blue: 0.0,alpha: 1.0), themeName: "Veggies", pairsOfCards: 14, id: 1),
            2: Theme.init(content: ["⚽️", "🏈", "🎾", "⚾️", "🏐", "🏓", "🥍", "🥏", "🏀", "🏏", "🏒", "🤺"], color: RGBAColor(red: 0.0, green: 0.0, blue: 1.0,alpha: 1.0), themeName: "Sports", pairsOfCards: 12, id: 2),
            3: Theme.init(content: ["🥐", "🥯", "🍞", "🥖", "🥨", "🧇", "🥞", "🫓", "🥪", "🍕", "🍩", "🍪"], color: RGBAColor(red: 0.25, green: 0.5, blue: 0.25,alpha: 1.0), themeName: "Delicious Bread", pairsOfCards: 12, id: 3),
            4: Theme.init(content: ["🎶", "🪘", "🪗", "🎷", "🎻", "🎺", "🎹", "🥁", "🎸", "🎤", "🎵", "🎼"], color: RGBAColor(red: 0.5, green: 0.0, blue: 0.5,alpha: 1.0), themeName: "Music", pairsOfCards: 12, id: 4),
            5: Theme.init(content: ["💽", "💾", "📞", "☎️", "📽", "📹", "📼", "📠", "📟", "🕹", "🖲", "💿"], color: RGBAColor(red: 1.0, green: 0.0, blue: 1.0,alpha: 1.0), themeName: "Tech", pairsOfCards: 12, id: 5)
        ]
}

