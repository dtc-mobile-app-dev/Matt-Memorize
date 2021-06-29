//
//  ContentView.swift
//  Memorize
//
//  Created by His Dudeness on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text("Hello!")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text("Hello!")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text("Hello!")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text("Hello!")
            }
        }
            .padding(.horizontal)
            .foregroundColor(.red)
    }
}

struct CardView {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
