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
}

extension CharactersApi: EndPoint {
    
    var path: String {
        switch self {
        case .charactersList:
            return "v1/public/characters"
            
        case .characterDetail:
            return "topics/"
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
                                        "hash": ApiConfiguration.hashKey
                                      ]
            )
            
        case .characterDetail(let id):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: [
                                        "page": id,
                                        "client_id": ApiConfiguration.apiKey
                                      ]
            )
        }
    }
}
