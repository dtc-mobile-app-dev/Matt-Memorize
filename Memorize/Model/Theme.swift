//
//  Theme.swift
//  Memorize
//
//  Created by His Dudeness on 7/21/21.
//

import Foundation

struct Theme<CardContent: Codable> : Identifiable, Codable, Hashable {
    
    static func == (lhs: Theme<CardContent>, rhs: Theme<CardContent>) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var content: [CardContent]
    var color: String
    var themeName: String
    var pairsOfCards: Int
    var id: Int
}

