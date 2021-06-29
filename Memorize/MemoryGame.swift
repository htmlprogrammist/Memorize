//
//  MemoryGame.swift
//  Memorize
//
//  Created by Егор Бадмаев on 12.06.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    // var cards: Array<MemoryGame.Card>  // то же самое, просто из-за того, что мы и так внутри структуры MemoryGame, это не обязательно писать. В остальных случаях, естественно, надо
    private(set) var cards: Array<Card>
    
    mutating func chooseCard(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0  // bogus!
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // добавляет numberOfPairsOfCards х2 карточек в cards
        for pairIndex in 0..<numberOfPairsOfCards {
            // cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>)) мы уже поставили значения по умолчанию, когда прописывали структуру Card, поэтому их писать не надо (лишний код)
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent  // мы делаем логику игры независимой от того, что там показано (content), поэтому используем не String, а выдуманный тип данных. Спикер назвал этот тип "don't care". Это нужно для того, чтобы можно было поменять эмоджи на картинки, например, и приложения дальше бы работало нормально, потому что не надо залезать в этот код (логику) и исправлять тип данных со String на Img
        // (см. на 10 строчку) В файле EmojiMemoryGame.swift мы определяем тип данных
        var id: Int
    }
}
