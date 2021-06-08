//
//  ListCellViewModel.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

protocol ListCellViewModelProtocol {
    var characterImage: String { get }
    var characterName: String { get }
    var characterId: Int { get }
}

class ListCellViewModel: ListCellViewModelProtocol {
    
    private var dataSource: MarvelCharacter
    
    init(dataSource: MarvelCharacter) {
        self.dataSource = dataSource
    }
    
    var characterImage: String {
        guard let imagePath = self.dataSource.thumbnail?.imagePath,
              let imageExt = self.dataSource.thumbnail?.imageExtension else { return "" }
        return imagePath + "." + imageExt
    }
    
    var characterName: String {
        self.dataSource.name ?? ""
    }
    
    var characterId: Int {
        self.dataSource.id ?? 0
    }
}
