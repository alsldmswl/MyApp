//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/01.
//

import Foundation

enum RMCharaterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
