//
//  CharacterDetailViewModel.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

class CharacterDetailViewModel {
    
    var dataSource: MarvelCharacter
    
    init(dataSource: MarvelCharacter) {
        self.dataSource = dataSource
    }
    
    func getCharacterImageUrl() -> String {
        guard let imagePath = self.dataSource.thumbnail?.imagePath,
              let imageExt = self.dataSource.thumbnail?.imageExtension else { return "" }
        return imagePath + "." + imageExt
    }
    
    func getCharacterDescription() -> String {
        self.dataSource.description ?? "No Description Available"
    }
    
    func getCharacterName() -> String {
        self.dataSource.name ?? ""
    }
}
