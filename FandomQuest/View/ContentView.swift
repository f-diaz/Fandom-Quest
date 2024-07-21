//
//  ContentView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedGame: Game? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if let game = selectedGame {
                    GameView(game: game)
                } else {
                    GameSelectionView(selectedGame: $selectedGame, games: games)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
