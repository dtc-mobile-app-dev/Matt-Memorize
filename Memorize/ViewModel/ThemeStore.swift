//
//  ThemeStore.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

struct Themed: Identifiable, Codable, Hashable {
    var name: String
    var emojis: String
    var id: Int
    
    fileprivate init(name: String, emojis: String, id: Int) {
        self.name = name
        self.emojis = emojis
        self.id = id
    }

}

class ThemeStore: ObservableObject {
        let name: String
        
    @Published var themes = [Themed] {
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
               let decodedThemes = try? JSONDecoder().decode(Array<Theme>.self, from: jsonData) {
                themes = decodedThemes
            }
    }
    
    init(named name: String) {
        self.name = name
        restoreFromUserDefaults()
        if themes.isEmpty {
            
        }
    }
}
