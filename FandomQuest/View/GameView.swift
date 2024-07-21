//
//  ContentView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//
import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    
    init(game: Game) {
        _viewModel = StateObject(wrappedValue: GameViewModel(game: game, numberOfPairsOfCards: 10))
    }
    
    var body: some View {
        VStack {
            Text("\(viewModel.gameName) Memory Game")
                .font(.largeTitle)
                .padding()
            
            gameBody
            
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text("Moves: \(viewModel.moves)")
            }
            .padding()
            
            Button("New Game") {
                viewModel.newGame()
            }
            .padding()
        }
        .padding()
    }
    
    var gameBody: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], spacing: 10) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: games[0])
    }
}
