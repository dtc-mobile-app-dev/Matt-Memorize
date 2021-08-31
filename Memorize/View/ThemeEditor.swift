//
//  ThemeEditor.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme<String>
    
    var body: some View {
        Form {
            nameSection
        }
        .navigationTitle("Edit \(theme.themeName)")
        .frame(minWidth: 300, minHeight: 350)
    }
    var nameSection: some View {
        Section(header: Text("Name")) {
            TextField("Name", text: $theme.themeName)
        }
    }
    
    @State private var emojisToAdd = ""
    
    var addEmojiSection: some View {
        Section(header: Text("Add Emojis")) {
            TextField("", text: $emojisToAdd)
                .onChange(of: emojisToAdd) { emojis in
                    addEmojis(emojis)
                }
        }
    }
    func addEmojis(_ emojis: String) {
        withAnimation {
            theme.emojis = (emojis + theme.emojis)
                .filter { $0.isEmoji}
                .removingDuplicateCharacters
        }
    }
    var removeEmojiSection: some View {
        Section(header: Text("Remove Emoji")) {
            let emojis = theme.emojis.removingDuplicateCharacters.map { String($0) }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            withAnimation {
                                theme.emojis.removeAll(where: { String($0) == emoji })
                            }
                        }
                }
            }
            .font(.system(size: 40))
        }
    }
}

//struct ThemeEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeEditor(theme: <#T##Binding<Theme<String>>#>)
//    }
//}
