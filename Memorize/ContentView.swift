//
//  ContentView.swift
//  Memorize
//
//  Created by His Dudeness on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["✈️", "🚀", "🚂", "🏎", "🛺", "🚜", "🛵", "🚟", "🚌", "🚕", "🚲", "🛴"]
    
    var emojiCount = 6
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Button(action: {emojiCount += 1}, label: {
                Text("Add")
                Text("Card")
            })
            Button(action: {emojiCount -= 1}, label: {
                Text("Remove")
                Text("Card")
            })
        }
            .padding(.horizontal)
            .foregroundColor(.red)
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
            Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
    }
}
