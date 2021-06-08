//
//  CharacterDetailViewModel.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

class CharacterDetailViewModel {
    
    var dataSource: MarvelCharacter?
    var characterId: Int
    let router = Router<CharactersApi>()
    
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    func getCharacterImageUrl() -> String {
        guard let imagePath = self.dataSource?.thumbnail?.imagePath,
              let imageExt = self.dataSource?.thumbnail?.imageExtension else { return "" }
        return imagePath + "." + imageExt
    }
    
    func fetchCharacterDetails() {
        router.request(CharactersApi.characterDetail(id: characterId)) { (result: Result<CharacterData, AppError>) in
            switch result {
            case .success(let data):
                guard let characterData = data.data?.results?.first else { return }
                self.dataSource = characterData
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCharacterDescription() -> String {
        self.dataSource?.description ?? ""
    }
    
    func getCharacterName() -> String {
        self.dataSource?.name ?? ""
    }
}
