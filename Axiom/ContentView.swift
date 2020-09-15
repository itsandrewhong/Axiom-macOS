//
//  ContentView.swift
//  Axiom
//
//  Created by Andrew Hong on 9/13/20.
//  Copyright © 2020 Raonpia. All rights reserved.
//


//  Main View

import SwiftUI

// Global variable
let images = Bundle.main.decode([String].self, from: "pictures.json")
let quotes = Bundle.main.decode([Quote].self, from: "quotes.json")

struct ContentView: View {
    
    //  Initial Load
    let initialQuote = quotes.randomElement()!
    let initialImage = images.randomElement()!

    var body: some View {
        VStack {
            ImageOverlay(selectedQuote: initialQuote, selectedImageName: initialImage)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

