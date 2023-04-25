//
//  Book.swift
//  SearchBook
//
//  Created by eun-ji on 2023/04/24.
//

import Foundation

struct Book: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]
    
}

struct Item: Codable {
    let title: String?
    let image: String?
    let author: String?
    let link: String?
}
