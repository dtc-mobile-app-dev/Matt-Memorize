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
}

//struct ThemeEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeEditor(theme: <#T##Binding<Theme<String>>#>)
//    }
//}
