//
//  GameSelectionView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import SwiftUI

struct GameSelectionView: View {
    @Binding var selectedGame: Game?
    var games: [Game]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select a Game")
                    .font(.largeTitle)
                    .padding()
                
                List(games, id: \.name) { game in
                    Button(action: {
                        selectedGame = game
                    }) {
                        Text(game.name)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationBarTitle("Game Selection")
        }
    }
}

struct GameSelectionView_Previews: PreviewProvider {
    @State static var selectedGame: Game? = nil
    
    static var previews: some View {
        GameSelectionView(selectedGame: $selectedGame, games: games)
    }
}
