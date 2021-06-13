//
//  ComicsData.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/13/21.
//

import Foundation

struct ComicsData: Decodable {
    var data: ComicsResult?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct ComicsResult: Decodable {
    var results: [ComicsInfo]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct ComicsInfo: Decodable {
    var title: String?
    var thumbnail: ComicImage?
    
    enum CodingKeys: String, CodingKey {
        case title, thumbnail
    }
}

struct ComicImage: Decodable {
    var image: String?
    var imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "path"
        case imageExtension = "extension"
    }
}
