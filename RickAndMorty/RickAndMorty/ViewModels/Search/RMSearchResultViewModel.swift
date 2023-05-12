//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/12.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
