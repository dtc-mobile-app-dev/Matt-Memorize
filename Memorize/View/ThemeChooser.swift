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
                        themeListItem(theme)
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
            .navigationBarItems(leading: Button(action: {
//                insert new theme here
                storeFront.insertTheme(named: "", color: <#T##RGBAColor#>, emojis: [], numberOfPairsOfCards: 0)
            } ){Image(systemName: "plus.circle")}, trailing: EditButton())
            .navigationBarTitleDisplayMode(.inline)
//          switch to navigationBarItems(leading:) in order to put in the "add theme" ability
            .environment(\.editMode, $editMode)
            .sheet(item: $themeToEdit) { theme in
                ThemeEditor(theme: $storeFront.themes[theme])
            }
        }
    }
        
        func themeListItem(_ theme: Theme<String>) -> some View {
                VStack {
                    Text("\(storeFront.themes[theme].themeName)")
                    Text("\(storeFront.themes[theme].pairsOfCards)")
                    Text(storeFront.themes[theme].content.joined())
                }
                .background(Color(rgbaColor: storeFront.themes[theme].color))
        }
    
    @State private var themeToEdit: Theme<String>?

    func tap(_ theme: Theme<String>) -> some Gesture {
        TapGesture().onEnded { themeToEdit = theme }
    }
}
