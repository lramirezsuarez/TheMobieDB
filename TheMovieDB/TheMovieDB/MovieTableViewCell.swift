//
//  MovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/1/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
}
