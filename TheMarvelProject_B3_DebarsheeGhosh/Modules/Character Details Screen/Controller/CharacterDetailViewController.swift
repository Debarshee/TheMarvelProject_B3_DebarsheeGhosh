//
//  CharacterDetailViewController.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet private weak var characterDescription: UILabel!
    @IBOutlet private weak var activityContainerView: UIView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var comicsCollectionView: UICollectionView! {
        didSet {
            self.comicsCollectionView.dataSource = self
        }
    }
    
    var viewModel: CharacterDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.delegate = self
        viewModel?.fetchCharacterDetails()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityContainerView.isHidden = true
        activityIndicatorView.stopAnimating()
        self.title = viewModel?.getCharacterName()
        characterImageView.downloadImage(with: viewModel?.getCharacterImageUrl())
        characterDescription.text = viewModel?.getCharacterDescription()
        viewModel?.fetchComics()
    }
}

extension CharacterDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.getComicsDataCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicsCollectionViewCell.identifier, for: indexPath) as? ComicsCollectionViewCell else {
            fatalError("Failed to dequeue the cell")
        }
        guard let data = viewModel?.getComicsData(at: indexPath.row) else { fatalError("Invalid Data") }
        cell.configure(configurator: data)
        return cell
    }
}

extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    func reloadCollection() {
        self.comicsCollectionView.reloadData()
    }
}
