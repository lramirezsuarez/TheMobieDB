//
//  MovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/9/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Cosmos

class MovieCollectionViewCell: UICollectionViewCell, MovieCell {    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var genreLabel: UILabel?
    @IBOutlet var overviewLabel: UILabel?
    @IBOutlet var posterImage: UIImageView?
    @IBOutlet var ratingCosmos: CosmosView?
    @IBOutlet var releaseDateLabel: UILabel?
}
