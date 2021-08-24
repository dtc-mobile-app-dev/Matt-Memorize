//
//  ThemeStore.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

class ThemeStore: ObservableObject {
        let name: String
        
    @Published var theme = [Theme<Any>]() {
            didSet {
                storeInUserDefaults()
            }
        }
        
        private var userDefaultsKey: String {
            "ThemeStore:" + name
        }
        
        private func storeInUserDefaults() {
            UserDefaults.standard.set(try? JSONEncoder().encode(theme), forKey: userDefaultsKey)
    //        UserDefaults.standard.set(palettes.map { [$0.name,$0.emojis,String($0.id)] }, forKey: userDefaultsKey )
        }
        
        private func restoreFromUserDefaults() {
            if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
               let decodedThemes = try? JSONDecoder().decode(Array<Theme>.self, from: jsonData) {
                theme = decodedThemes
            }
    }
    
    init(named name: String) {
        self.name = name
        restoreFromUserDefaults()
        if theme.isEmpty {
            
        }
    }
    func theme(at index: Int) -> Theme<Any> {
        let safeIndex = min(max(index, 0), theme.count - 1)
        return theme[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if theme.count > 1, theme.indices.contains(index) {
            theme.remove(at: index)
        }
        return index % theme.count
    }
    
    func insertTheme(named name: String, emojis: String? = nil, at index: Int = 0) {
        let unique = (theme.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let themes = Theme(name: name, emojis: emojis ?? "", id: unique)
        let safeIndex = min(max(index, 0), theme.count)
        theme.insert(themes, at: safeIndex)
    }

}
