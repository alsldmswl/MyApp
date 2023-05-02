//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/01.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

