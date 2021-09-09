//
//  ThemeChooser.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var storeFront: ThemeStore<String>
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editMode: EditMode = .inactive
    
//    @State var theme: Theme<Int>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(storeFront.themes) { theme in
                    NavigationLink(destination: EmojiGameView(game: EmojiMemoryGame(theme))) {
                        themeListItem(theme: theme)
                    }
                    .gesture(editMode == .active ? tap(theme) : nil)
                }
                .onDelete { indexSet in
                    storeFront.themes.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, newOffset in
                    storeFront.themes.move(fromOffsets: indexSet, toOffset: newOffset)
                }
            }
            .navigationTitle("Memorize")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem { EditButton() }
            }
            .environment(\.editMode, $editMode)
            .sheet(item: $themeToEdit) { theme in
                ThemeEditor(theme: $storeFront.themes[theme])
            }
        }
        
        func themeListItem(_ theme: Theme<String>) -> some View {
            VStack {
                themeName
                pairsOfCards
                emojis
            }
            .background(Color(rgbaColor: storeFront.themes[theme].color))
        }
        var themeName: some View {
            Text("\(storeFront.themes[theme].themeName)")
        }
        var pairsOfCards: some View {
            Text("\(storeFront.themes[theme].pairsOfCards)")
        }
        var emojis: some View {
            Text(storeFront.themes[theme].content.joined())
        }
        
    }
    
    @State private var themeToEdit: Theme<String>?

    func tap(_ theme: Theme<String>) -> some Gesture {
        TapGesture().onEnded { themeToEdit = theme }
    }
    
//    struct ThemeListItem: View {
//        var theme: Theme<String>
//
//        var body: some View {
//            VStack {
//                themeName
//                pairsOfCards
//                emojis
//            }
//            .background(Color(rgbaColor: storeFront.themes[theme].color))
//        }
//
//        var themeName: some View {
//            Text("\(theme.themeName)")
//        }
//
//        var pairsOfCards: some View {
//            Text("\(theme.pairsOfCards)")
//        }
//
//        var emojis: some View {
//            Text(theme.content.joined())
//        }
//    }

//struct ThemeChooser_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChooser(theme: Themes.themes [4])
//    }
//}
}
