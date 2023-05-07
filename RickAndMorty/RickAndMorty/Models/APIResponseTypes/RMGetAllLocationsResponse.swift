//
//  RMGetLocationsResponse.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/07.
//

import Foundation


struct RMGetAllLocationsResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMLocation]
}
