//
//  ListViewModel.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

protocol ListViewModelDelegate: AnyObject {
    func reloadTable()
}

class ListViewModel {
    
    var dataSource: [MarvelCharacter]
    weak var delegate: ListViewModelDelegate?
    let router = Router<CharactersApi>()
    
    init(delegate: ListViewModelDelegate) {
        self.delegate = delegate
        self.dataSource = []
    }
    
    func fetchData() {
        router.request(CharactersApi.charactersList) { (result: Result<CharacterData, AppError>) in
            switch result {
            case .success(let data):
                if let charData = data.data {
                    print(charData)
                } else {
                    print("ERROR")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
