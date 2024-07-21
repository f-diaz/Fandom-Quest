//
//  GameViewModel.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published private var model: GameModel
    @Published private var faceUpCardIndices: [Int] = []
    private var autoCloseTimer: AnyCancellable?
    let gameName: String
    
    var cards: [Card] { model.cards }
    var score: Int { model.score }
    var moves: Int { model.moves }
    
    var onPairMatched: ((String) -> Void)? // Callback para cuando se emparejan cartas
    
    init(game: Game, numberOfPairsOfCards: Int) {
        self.gameName = game.name
        self.model = GameViewModel.createNewGame(from: game, numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    func choose(_ card: Card) {
        autoCloseTimer?.cancel()
        
        if let chosenIndex = model.cards.firstIndex(where: { $0.id == card.id }),
           !model.cards[chosenIndex].isFaceUp,
           !model.cards[chosenIndex].isMatched {
            
            if faceUpCardIndices.count == 2 {
                closeUnmatchedCards()
            }
            
            model.cards[chosenIndex].isFaceUp = true
            faceUpCardIndices.append(chosenIndex)
            model.moves += 1
            
            if faceUpCardIndices.count == 2 {
                checkForMatch()
            }
        }
    }
    
    private func checkForMatch() {
        guard faceUpCardIndices.count == 2 else { return }
        
        let firstIndex = faceUpCardIndices[0]
        let secondIndex = faceUpCardIndices[1]
        
        if model.cards[firstIndex].character == model.cards[secondIndex].character {
            model.cards[firstIndex].isMatched = true
            model.cards[secondIndex].isMatched = true
            model.incrementComboStreak()
            model.score += 2 + model.comboStreak
            faceUpCardIndices.removeAll()
            
            // Callback para la biografía
            onPairMatched?(model.cards[firstIndex].biography)
        } else {
            model.resetComboStreak()
            model.score = max(0, model.score - 1)
            autoCloseTimer = Timer.publish(every: 0.5, on: .main, in: .common)
                .autoconnect()
                .first()
                .sink { [weak self] _ in
                    self?.closeUnmatchedCards()
                }
        }
    }
    
    private func closeUnmatchedCards() {
        faceUpCardIndices.forEach { model.cards[$0].isFaceUp = false }
        faceUpCardIndices.removeAll()
    }
    
    func newGame() {
        autoCloseTimer?.cancel()
        model = GameViewModel.createNewGame(from: Game(name: gameName, cards: model.cards), numberOfPairsOfCards: 8)
        faceUpCardIndices.removeAll()
    }
    
    private static func createNewGame(from game: Game, numberOfPairsOfCards: Int) -> GameModel {
        var cards: [Card] = []
        let selectedCards = game.cards.prefix(numberOfPairsOfCards)
        
        for card in selectedCards {
            cards.append(card)
            cards.append(Card(character: card.character, imageName: card.imageName, biography: card.biography))
        }
        
        cards.shuffle()
        
        return GameModel(cards: cards, score: 0, moves: 0, comboStreak: 0)
    }
}
