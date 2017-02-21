//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/7/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage
import Cosmos

class MovieDetailViewController: UIViewController {
    var detail : Movie?
    
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var overviewTextView: UITextView!
    @IBOutlet var ratingCosmosView: CosmosView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var popularityLabel: UILabel!
    @IBOutlet var votesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        posterImage.af_setImage(withURL: (detail?.poster)!, placeholderImage: #imageLiteral(resourceName: "poster-placeholder"), imageTransition: .curlUp(0.5))
        titleLabel.text = detail?.name
        genresLabel.text = detail?.genre
        yearLabel.text = detail?.year
        overviewTextView.text = detail?.overview
        ratingCosmosView.rating = (detail?.rating)!
        ratingLabel.text = "Rating:\(detail!.rating)/5"
        popularityLabel.text = "Popularity: \(detail!.popularity)%"
        votesLabel.text = "Votes: \(detail!.votes)"
    }
    
    
    
}
