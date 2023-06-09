//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/01.
//

import Foundation

@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    case character
    case location
    case episode
}
