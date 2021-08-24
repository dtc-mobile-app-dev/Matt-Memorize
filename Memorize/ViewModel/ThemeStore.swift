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
        
    @Published var themed = [Themed]() {
            didSet {
                storeInUserDefaults()
            }
        }
        
        private var userDefaultsKey: String {
            "ThemeStore:" + name
        }
        
        private func storeInUserDefaults() {
            UserDefaults.standard.set(try? JSONEncoder().encode(themed), forKey: userDefaultsKey)
    //        UserDefaults.standard.set(palettes.map { [$0.name,$0.emojis,String($0.id)] }, forKey: userDefaultsKey )
        }
        
        private func restoreFromUserDefaults() {
            if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
               let decodedThemes = try? JSONDecoder().decode(Array<Themed>.self, from: jsonData) {
                themed = decodedThemes
            }
    }
    
    init(named name: String) {
        self.name = name
        restoreFromUserDefaults()
        if themed.isEmpty {
            
        }
    }
    func themed(at index: Int) -> Themed {
        let safeIndex = min(max(index, 0), themed.count - 1)
        return themed[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if themed.count > 1, themed.indices.contains(index) {
            themed.remove(at: index)
        }
        return index % themed.count
    }
    
    func insertThemed(named name: String, emojis: String? = nil, at index: Int = 0) {
        let unique = (themed.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let themes = Themed(name: name, emojis: emojis ?? "", id: unique)
        let safeIndex = min(max(index, 0), themed.count)
        themed.insert(themes, at: safeIndex)
    }

}
