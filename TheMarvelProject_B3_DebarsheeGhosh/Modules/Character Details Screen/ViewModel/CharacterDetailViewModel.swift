//
//  CharacterDetailViewModel.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

protocol CharacterDetailViewModelDelegate: AnyObject {
    func reloadCollection()
}

class CharacterDetailViewModel {
    
    weak var delegate: CharacterDetailViewModelDelegate?
    var dataSource: MarvelCharacter?
    var characterId: Int
    let router = Router<CharactersApi>()
    var comicsDataSource: [ComicsCollectionCellViewModel] {
        didSet {
            self.delegate?.reloadCollection()
        }
    }
    
    init(characterId: Int) {
        self.characterId = characterId
        self.comicsDataSource = []
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
    
    func fetchComics() {
        router.request(CharactersApi.comicsList(characterId: characterId)) { (result: Result<ComicsData, AppError>) in
            switch result {
            case .success(let list):
                guard let comicData = list.data?.results else { fatalError("Invalid Data") }
                self.comicsDataSource = comicData.compactMap { ComicsCollectionCellViewModel(dataSource: $0) }
                
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
    
    func getComicsDataCount() -> Int {
        comicsDataSource.count
    }
    
    func getComicsData(at index: Int) -> ComicsCollectionCellViewModel {
        comicsDataSource[index]
    }
}
