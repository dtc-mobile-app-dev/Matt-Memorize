//
//  ContentView.swift
//  Memorize
//
//  Created by His Dudeness on 6/29/21.
//

import SwiftUI

struct EmojiGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    @Namespace private var dealingNameSpace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                themeNameDisplay
                Spacer()
                score
                gameBody
                HStack {
                    newGame
                    Spacer()
                    shuffle
                }
                .padding(.horizontal)
            }
            deckBody
        }
        .padding()
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) *  (CardConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if isUndealt(card) || card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(of: card))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(Color(rgbaColor: game.theme.color))
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(Color(rgbaColor: game.theme.color))
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                        deal(card)
                    }
            }
        }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
    
    var newGame: some View {
        Button("New Game") {
            withAnimation {
                dealt = []
                game.newGame()
            }
        }
    }
    
    var score: some View {
        Text("Score: \(game.score)")
    }
    
    var themeNameDisplay: some View {
        Text("\(game.theme.themeName)")
    }
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth: CGFloat = 60
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                if card.isConsumingBonusTime {
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1 - animatedBonusRemaining) * 360 - 90))
                        .onAppear {
                            animatedBonusRemaining = card.bonusRemaining
                            withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                animatedBonusRemaining = 0
                            }
                        }
                } else {
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1 - card.bonusRemaining) * 360 - 90))
                    }
                }
                .padding(5)
                .opacity(0.5)
                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                        .font(Font.system(size: DrawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
                }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
            }
        }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
}
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.65
        static let circlePadding: CGFloat = 4
        static let fontSize: CGFloat = 32
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(Themes.themes[0])
        game.choose(game.cards.first!)
        return EmojiGameView(game: game)
    }
}
