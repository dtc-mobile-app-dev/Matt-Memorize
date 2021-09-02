//
//  ThemeEditor.swift
//  Memorize
//
//  Created by His Dudeness on 8/24/21.
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme<String>
    
    @State private var editMode: EditMode = .inactive
    
    
    
    var body: some View {
        Form {
            nameSection
            addItemSection
            removeItemSection
        }
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
            let tempArray = Array(content)
            for item in tempArray {
                theme.content.append(String(item))
            }
            theme.content
                .removeDuplicates()
        }
    }
    var removeItemSection: some View {
        Section(header: Text("Remove Emoji")) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(theme.content, id: \.self) { item in
                    Text(item)
                        .onTapGesture {
                            withAnimation {
                                theme.content.removeAll(where: { String($0) == item })
                            }
                        }
                }
            }
            .font(.system(size: 40))
        }
    }
}
