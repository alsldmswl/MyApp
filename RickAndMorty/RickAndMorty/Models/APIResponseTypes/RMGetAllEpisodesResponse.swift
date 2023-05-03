//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/03.
//

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMEpisode]
}
