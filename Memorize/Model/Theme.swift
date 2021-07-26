//
//  Theme.swift
//  Memorize
//
//  Created by His Dudeness on 7/21/21.
//

import Foundation

struct Theme<CardContent> {
    var content: [CardContent]
    var color: String
    var themeName: String
    var numberOfPairsOfCards: Int
}

