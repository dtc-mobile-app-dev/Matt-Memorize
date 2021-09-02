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
                        ThemeListItem(theme: theme)
                    }
                    .gesture(editMode == .active ? tap : nil)
                }
            }
            .navigationTitle("Memorize")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem { EditButton() }
                ToolbarItem(placement: .navigationBarLeading) {
                    if presentationMode.wrappedValue.isPresented,
                       UIDevice.current.userInterfaceIdiom != .pad {
                        Button("Close") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .environment(\.editMode, $editMode)
        }
    }

    var tap: some Gesture {
        TapGesture().onEnded { }
    }
    
struct ThemeListItem: View {
    var theme: Theme<String>
    
    var body: some View {
        VStack {
            themeName
            pairsOfCards
            emojis
        }
        .background(Color(rgbaColor: theme.color))
    }
    
    var themeName: some View {
        Text("\(theme.themeName)")
    }
    
    var pairsOfCards: some View {
        Text("\(theme.pairsOfCards)")
    }
    
    var emojis: some View {
        Text(theme.content.joined())
    }
    
}

//struct ThemeChooser_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChooser(theme: Themes.themes [4])
//    }
//}
}
