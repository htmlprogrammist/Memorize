//
//  ContentView.swift
//  Memorize
//
//  Created by Егор Бадмаев on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0;
    
    var body: some View {
        VStack {
            Text("You have clicked \(count) times")
            Button(action: {count += 1}) {
                Text("Button")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
