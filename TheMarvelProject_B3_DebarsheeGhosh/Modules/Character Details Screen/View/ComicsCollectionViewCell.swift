//
//  ComicsCollectionViewCell.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/13/21.
//

import UIKit

class ComicsCollectionViewCell: UICollectionViewCell, ViewReusable {
    @IBOutlet private weak var comicImageView: UIImageView!
    @IBOutlet private weak var comicLabel: UILabel!
    
    func configure(configurator: ComicsCollectionCellViewModel) {
        comicImageView.downloadImage(with: configurator.comicImage)
        comicLabel.text = configurator.comicTitle
    }
}
