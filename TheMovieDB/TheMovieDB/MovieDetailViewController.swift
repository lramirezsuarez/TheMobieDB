//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/7/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    var detail : Movie?

    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var overviewTextView: UITextView!
    @IBOutlet var popularityLabel: UILabel!
    @IBOutlet var votesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        posterImage.af_setImage(withURL: (detail?.poster)!, placeholderImage: #imageLiteral(resourceName: "poster-placeholder"), imageTransition: .curlUp(0.5))
        titleLabel.text = detail?.name
        genresLabel.text = detail?.genre
        yearLabel.text = detail?.year
        overviewTextView.text = detail?.overview
        popularityLabel.text = "Popularity: \(detail!.popularity)%"
        votesLabel.text = "Votes: \(detail!.votes)"
    }



}
