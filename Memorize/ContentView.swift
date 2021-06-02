//
//  ContentView.swift
//  Memorize
//
//  Created by Егор Бадмаев on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            // Это функция
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 2.0)

            Text("Hello, world!")
                .font(.title)
        })
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
