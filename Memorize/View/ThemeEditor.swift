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
    
    @State private var itemToAdd = ""
    
    var addItemSection: some View {
        Section(header: Text("Add Emojis")) {
            TextField("", text: $itemToAdd)
                .onChange(of: itemToAdd) { content in
                    addItems(content)
                }
        }
    }
    func addItems(_ content: String) {
        withAnimation { // turn content String into [String], iterate over array and add each item to theme.content
            for content in theme.content {
                
            }
            theme.content = (content + theme.content)
                .filter { $0.isEmoji}
                .removingDuplicateCharacters
        }
    }
    var removeEmojiSection: some View {
        Section(header: Text("Remove Emoji")) {
            let emojis = theme.content.removingDuplicateCharacters.map { String($0) }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(theme.content, id: \.self) { content in
                    Text(content)
                        .onTapGesture {
                            withAnimation {
                                theme.emojis.removeAll(where: { String($0) == content })
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
