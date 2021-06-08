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
    
    var dataSource: [ListCellViewModel] {
        didSet {
            self.delegate?.reloadTable()
        }
    }
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
                guard let characterList = data.data?.results else { return }
                self.dataSource = characterList.compactMap { ListCellViewModel(dataSource: $0) }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func rowsForTable() -> Int {
        self.dataSource.count
    }
    
    func dataForCell(at index: Int) -> ListCellViewModel {
        self.dataSource[index]
    }
}
