//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var movies = [Movie]()
    var page = 1
    var totalPages = 0
    var refreshControl = UIRefreshControl()
    
    @IBOutlet var tableViewMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToTable()
        self.tableViewMovies.refreshControl = refreshControl
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(ViewController.refreshAction(sender:)), for: UIControlEvents.valueChanged)
    }
    
    func loadDataToTable() {
        MoviesFacade.RetrieveInfo(mediaType: .nowPlaying, page: page) {
            (moviesResponse, error) in
            guard let resultMovies = moviesResponse?.movies,
                let totalPages = moviesResponse?.totalPages else {
                    return
            }
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
            self.movies.append(contentsOf: resultMovies)
            self.totalPages = totalPages
            self.tableViewMovies.reloadData()
        }
    }
    
    func refreshAction(sender: UIRefreshControl) {
        self.page = 1
        self.movies.removeAll()
        self.tableViewMovies.reloadData()
        self.loadDataToTable()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MovieTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell

        let movie = movies[indexPath.row]
        
        cell.titleLabel?.text = movie.name
        cell.overviewLabel?.text = movie.overview
        cell.releaseDateLabel?.text = "Release date: \(movie.year)"
        
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: #imageLiteral(resourceName: "poster-placeholder").size, radius: 10.0)
        
        cell.posterImage?.af_setImage(withURL: movie.poster, placeholderImage: #imageLiteral(resourceName: "poster-placeholder"),
                                     filter: filter, imageTransition: .flipFromBottom(0.5))
        cell.ratingCosmos?.rating = movie.rating

        return cell
    }
}

