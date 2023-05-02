//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/02.
//

import Foundation

final class RMCharacterDetailViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
