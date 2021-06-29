//
//  MemoryGame.swift
//  Memorize
//
//  Created by Егор Бадмаев on 12.06.2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    // var cards: Array<MemoryGame.Card>  // то же самое, просто из-за того, что мы и так внутри структуры MemoryGame, это не обязательно писать. В остальных случаях, естественно, надо
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFacedUpCard: Int?
    
    mutating func chooseCard(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),  // $0.id equals 'That card's id'
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFacedUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFacedUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
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
