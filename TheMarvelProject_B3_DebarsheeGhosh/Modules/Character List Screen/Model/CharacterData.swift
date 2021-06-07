//
//  CharacterData.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

struct CharacterData: Decodable {
    var data: Results?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct Results: Decodable {
    var results: [MarvelCharacter]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct MarvelCharacter: Decodable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
    
    enum CodingKeys: String, CodingKey {
        case name, description, thumbnail
    }
}

struct Thumbnail: Decodable {
    var imagePath: String?
    var imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case imagePath = "path"
        case imageExtension = "extension"
    }
}
