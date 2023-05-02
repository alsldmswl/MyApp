//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by eun-ji on 2023/05/01.
//

import Foundation

final class RMRequest {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    
    private let pathComponents: [String]
    
    private let queryParameter: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameter.isEmpty {
            string += "?"
            let argumentString = queryParameter.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
        
        
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameter: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameter = queryParameter
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
