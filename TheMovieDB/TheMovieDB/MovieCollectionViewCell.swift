//
//  MovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/9/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Cosmos

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingCosmosView: CosmosView!
}
