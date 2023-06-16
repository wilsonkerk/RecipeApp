//
//  ContentView.swift
//  RecipeApp
//
//  Created by Wilson Kerk on 14/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipesViewModel())
    }
}
