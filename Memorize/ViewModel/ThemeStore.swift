//
//  ThemeStore.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

class ThemeStore<CardContent: Codable> : ObservableObject {
        let name: String
        
    @Published var themes = [Theme<CardContent>]() {
            didSet {
                storeInUserDefaults()
            }
        }
        
        private var userDefaultsKey: String {
            "ThemeStore:" + name
        }
        
        private func storeInUserDefaults() {
            UserDefaults.standard.set(try? JSONEncoder().encode(themes), forKey: userDefaultsKey)
    //        UserDefaults.standard.set(palettes.map { [$0.name,$0.emojis,String($0.id)] }, forKey: userDefaultsKey )
        }
        
        private func restoreFromUserDefaults() {
            if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
               let decodedThemes = try? JSONDecoder().decode(Array<Theme<CardContent>>.self, from: jsonData) {
                themes = decodedThemes
            }
        }
    
    init(named name: String) where CardContent == String {
        self.name = name
        restoreFromUserDefaults()
        if themes.isEmpty {
            for theme in Themes.themes {
                insertTheme(theme)
            }
        }
    }
    func theme(at index: Int) -> Theme<CardContent> {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if themes.count > 1, themes.indices.contains(index) {
            themes.remove(at: index)
        }
        return index % themes.count
    }
    
    func insertTheme(_ theme: Theme<CardContent>, at index: Int = 0) {
        let safeIndex = min(max(index, 0), themes.count)
        themes.insert(theme, at: safeIndex)
    }
    
    func insertTheme(named name: String, color: RGBAColor, emojis: [CardContent], numberOfPairsOfCards: Int, at index: Int = 0) {
        let unique = (themes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let theme = Theme<CardContent>(content: emojis, color: RGBAColor(red: 0, green: 0, blue: 0, alpha: 1), themeName: name, pairsOfCards: numberOfPairsOfCards, id: unique)
        insertTheme(theme)
    }

}
