//
//  ContentView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: GameViewModel
    @State private var selectedBiography: String = ""
    
    init(game: Game) {
        let viewModel = GameViewModel(game: game, numberOfPairsOfCards: 8)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("\(viewModel.gameName) Memory Game")
                .font(.headline)  // Título más pequeño
                .padding(.top)
            
            gameBody
            
            Text(selectedBiography)
                .font(.caption)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .center)
                .lineLimit(3)  // Menos espacio para la biografía
            
            HStack {
                Button("Atrás") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                
                Spacer()
                
                Button("New Game") {
                    viewModel.newGame()
                    selectedBiography = ""
                    viewModel.onPairMatched = { biography in
                        self.selectedBiography = biography
                    }
                }
                .padding()
            }
            .padding(.horizontal)
            
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text("Moves: \(viewModel.moves)")
            }
            .padding(.horizontal)
        }
        .padding()
        .onAppear {
            viewModel.onPairMatched = { biography in
                self.selectedBiography = biography
            }
        }
    }
    
    var gameBody: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 10) {  // Cartas más pequeñas
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .padding(.horizontal)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: games[0])
    }
}
