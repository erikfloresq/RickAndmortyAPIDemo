//
//  ContentView.swift
//  RickAndmortyAPIDemo
//
//  Created by Erik Flores on 30/3/21.
//

import SwiftUI
import RickAndMortyAPI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                Text(character.name)
            }.navigationTitle("RickAndMortyAPI")
        }.onAppear {
            self.viewModel.getCharacter()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
