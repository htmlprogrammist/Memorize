//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Егор Бадмаев on 12.06.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗", "🚕", "🚙", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚄", "🛩", "🚀", "🛸", "🚁", "⛵️", "🛳"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { pairIndex in
                EmojiMemoryGame.emojis[pairIndex]
            })
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.chooseCard(card)
    }
}
