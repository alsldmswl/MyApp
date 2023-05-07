//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/07.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    public var hasMoreResults: Bool {
        return false
    }
}
