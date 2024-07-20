//
//  ContentView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("Star Wars Memory")
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
        // Ajustamos las columnas para que las cartas se muestren mejor
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
