//
//  GameViewModel.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//
import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    // El modelo del juego, marcado como @Published para notificar a la vista de cambios
    @Published private var model: GameModel
    
    // Array para rastrear los índices de las cartas actualmente boca arriba
    @Published private var faceUpCardIndices: [Int] = []
    
    // Temporizador para cerrar las cartas automáticamente
    private var autoCloseTimer: AnyCancellable?
    
    // Propiedades computadas para exponer datos del modelo a la vista
    var cards: [Card] { model.cards }
    var score: Int { model.score }
    var moves: Int { model.moves }
    
    // Inicializador del ViewModel
    init(numberOfPairsOfCards: Int = 8) {
        model = GameViewModel.createNewGame(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    // MARK: - Intent(s)
    
    // Maneja la intención del usuario de elegir una carta
    func choose(_ card: Card) {
        // Cancela cualquier temporizador existente
        autoCloseTimer?.cancel()
        
        // Busca el índice de la carta seleccionada
        if let chosenIndex = model.cards.firstIndex(where: { $0.id == card.id }),
           !model.cards[chosenIndex].isFaceUp,
           !model.cards[chosenIndex].isMatched {
            
            // Si ya hay dos cartas boca arriba, las volteamos antes de procesar la nueva selección
            if faceUpCardIndices.count == 2 {
                closeUnmatchedCards()
            }
            
            // Voltea la carta seleccionada y añade su índice a faceUpCardIndices
            model.cards[chosenIndex].isFaceUp = true
            faceUpCardIndices.append(chosenIndex)
            
            // Incrementa el contador de movimientos
            model.moves += 1
            
            // Si hay dos cartas boca arriba, verifica si hay coincidencia
            if faceUpCardIndices.count == 2 {
                checkForMatch()
            }
        }
    }
    
    // Verifica si hay un emparejamiento entre las dos cartas boca arriba
    private func checkForMatch() {
        guard faceUpCardIndices.count == 2 else { return }
        
        let firstIndex = faceUpCardIndices[0]
        let secondIndex = faceUpCardIndices[1]
        
        if model.cards[firstIndex].character == model.cards[secondIndex].character {
            model.cards[firstIndex].isMatched = true
            model.cards[secondIndex].isMatched = true
            model.incrementComboStreak()
            model.score += 2 + model.comboStreak  // Bonificación por combo
            faceUpCardIndices.removeAll()
        } else {
            model.resetComboStreak()
            model.score = max(0, model.score - 1)  // Penalización por error
            autoCloseTimer = Timer.publish(every: 0.5, on: .main, in: .common)
                .autoconnect()
                .first()
                .sink { [weak self] _ in
                    self?.closeUnmatchedCards()
                }
        }
    }
    
    // Cierra las cartas que no coinciden
    private func closeUnmatchedCards() {
        faceUpCardIndices.forEach { model.cards[$0].isFaceUp = false }
        faceUpCardIndices.removeAll()
    }
    
    // Inicia un nuevo juego
    func newGame() {
        autoCloseTimer?.cancel()
        model = GameViewModel.createNewGame(numberOfPairsOfCards: 8)
        faceUpCardIndices.removeAll()
    }
    
    // Método estático para crear un nuevo juego
    private static func createNewGame(numberOfPairsOfCards: Int) -> GameModel {
        let characters = ["Luke", "Leia", "Han", "Chewbacca", "Darth Vader", "Yoda", "R2-D2", "C-3PO"]
        let imageNames = ["luke", "leia", "han", "chewbacca", "vader", "yoda", "r2d2", "c3po"]
        var cards: [Card] = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let character = characters[pairIndex]
            let imageName = imageNames[pairIndex]
            cards.append(Card(character: character, imageName: imageName))
            cards.append(Card(character: character, imageName: imageName))
        }
        
        cards.shuffle()
        
        return GameModel(cards: cards, score: 0, moves: 0, comboStreak: 0)
    }
}
