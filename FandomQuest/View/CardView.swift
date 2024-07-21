//
//  CardView.swift
//  FandomQuest
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                VStack {
                    Image(card.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                    
                    Text(card.character)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 5)
                        .background(Color.white)
                        .cornerRadius(5)
                }
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill().foregroundColor(.blue)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .shadow(radius: 2)
    }
}
