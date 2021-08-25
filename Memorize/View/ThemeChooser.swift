//
//  ThemeChooser.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var storeFront: ThemeStore<String>
    
    @State var theme: Theme<Int>
    
    
    var body: some View {
        List {
            ForEach(storeFront.themes) { theme in
                ThemeListItem(theme: $theme)
            }
        }
    }
}

struct ThemeListItem: View {
    @Binding var theme: Theme<Int>
    
    var body: some View {
        
    }
}

//struct ThemeChooser_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChooser(theme: Themes.themes [4])
//    }
//}
