//
//  ThemeChooser.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var storeFront: ThemeStore<String>
    
    
    var body: some View {
        List {
            ForEach(storeFront.themes) { theme in
                Text("Theme is: \(theme.themeName)")
            }
        }
    }
}

struct ThemeChooser_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChooser()
    }
}

struct ThemeListItem: Hashable, Codable {
    
}
