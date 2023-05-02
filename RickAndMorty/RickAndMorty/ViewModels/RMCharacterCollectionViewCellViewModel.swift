//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/02.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {

    public let characterName: String
    private let characterStatus: RMCharaterStatus
    private let characterImageUrl: URL?
    
    init (
    characterName: String,
    characterStatus: RMCharaterStatus,
    characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(url, completion: completion)
       
    }
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
}
