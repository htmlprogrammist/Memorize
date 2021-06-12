//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Егор Бадмаев on 12.06.2021.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "🤔"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: makeCardContent)

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
