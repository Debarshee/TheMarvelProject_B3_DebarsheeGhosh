//
//  CharacterDetailViewController.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterDescription: UITextView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    
    var viewModel: CharacterDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchCharacterDetails()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        characterImageView.downloadImage(with: viewModel?.getCharacterImageUrl())
        characterDescription.text = viewModel?.getCharacterDescription()
        characterNameLabel.text = viewModel?.getCharacterName()
    }
}
