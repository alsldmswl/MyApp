//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/01.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name, species, type: String
    let status: RMCharaterStatus
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}




