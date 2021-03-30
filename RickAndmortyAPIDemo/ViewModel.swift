//
//  ViewModel.swift
//  RickAndmortyAPIDemo
//
//  Created by Erik Flores on 30/3/21.
//

import Combine
import RickAndMortyAPI

class ViewModel: ObservableObject {
    let rickAndMortyAPI = RickAndMortyAPI()
    @Published var characters = [Character]()
    var cancellable = Set<AnyCancellable>()

    func getCharacter() {
        rickAndMortyAPI
            .getCharacter()
            .map { $0.results }
            .sink { (completion) in
                print("")
            } receiveValue: { (characters) in
                self.characters = characters
            }.store(in: &cancellable)
    }

}
