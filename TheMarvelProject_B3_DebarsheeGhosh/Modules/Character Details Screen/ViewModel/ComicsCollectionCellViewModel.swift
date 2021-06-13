//
//  CharacterCollectionCellViewModel.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/13/21.
//

import Foundation

protocol ComicsCollectionCellViewModelProtocol {
    var comicImage: String { get }
    var comicTitle: String { get }
}

class ComicsCollectionCellViewModel: ComicsCollectionCellViewModelProtocol {
    
    private var dataSource: ComicsInfo
    
    init(dataSource: ComicsInfo) {
        self.dataSource = dataSource
    }
    
    var comicImage: String {
        guard let imagePath = self.dataSource.thumbnail?.image,
              let imageExt = self.dataSource.thumbnail?.imageExtension else { return "" }
        return imagePath + "." + imageExt
    }
    
    var comicTitle: String {
        self.dataSource.title ?? ""
    }
}
