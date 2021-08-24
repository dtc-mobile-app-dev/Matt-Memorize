//
//  MemorizeApp.swift
//  Memorize
//
//  Created by His Dudeness on 6/29/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ThemeChooser()
        }
    }
}
