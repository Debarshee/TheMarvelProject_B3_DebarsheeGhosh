//
//  ListTableTableViewCell.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import UIKit

class ListTableTableViewCell: UITableViewCell, ViewReusable {
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    
    func configure(configurator: ListCellViewModel) {
        characterImageView.downloadImage(with: configurator.characterImage)
        characterNameLabel.text = configurator.characterName
    }
}
