//
//  CharactersApi.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

enum CharactersApi {
    case charactersList
    case characterDetail(id: Int)
    case comicsList(characterId: Int)
}

extension CharactersApi: EndPoint {
    
    var path: String {
        switch self {
        case .charactersList:
            return "v1/public/characters"
            
        case .characterDetail(let id):
            return "v1/public/characters/\(id)"
            
        case .comicsList:
            return "v1/public/comics"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .charactersList:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: [
                                        "ts": 1,
                                        "apikey": ApiConfiguration.apiKey,
                                        "hash": ApiConfiguration.hashKey,
                                        "limit": 100
                                      ]
            )
            
        case .characterDetail:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: [
                                        "ts": 1,
                                        "apikey": ApiConfiguration.apiKey,
                                        "hash": ApiConfiguration.hashKey
                                      ]
            )
            
        case .comicsList(let characterId):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: [
                                        "ts": 1,
                                        "apikey": ApiConfiguration.apiKey,
                                        "hash": ApiConfiguration.hashKey,
                                        "limit": 100,
                                        "characters": characterId
                                      ]
            )
        }
    }
}
