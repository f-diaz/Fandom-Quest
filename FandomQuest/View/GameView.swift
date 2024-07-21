//
//  ContentView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//
import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: GameViewModel
    @State private var selectedBiography: String = ""
    
    init(game: Game) {
        _viewModel = StateObject(wrappedValue: GameViewModel(game: game, numberOfPairsOfCards: 8))
    }
    
    var body: some View {
        VStack {
            Text("\(viewModel.gameName) Memory Game")
                .font(.title)  // Título más pequeño
                .padding()
            
            gameBody
            
            Text(selectedBiography)
                .font(.caption)
                .padding()
            
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text("Moves: \(viewModel.moves)")
            }
            .padding()
            
            Button("New Game") {
                viewModel.newGame()
                selectedBiography = ""
            }
            .padding()
        }
        .padding()
    }
    
    var gameBody: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 10) {  // Cartas más pequeñas
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                        if card.isFaceUp {
                            selectedBiography = card.biography
                        }
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
