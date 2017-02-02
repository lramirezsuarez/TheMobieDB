//
//  NowPlayingViewController.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/2/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var movies = [Movie]()
    var page = 1
    var totalPages = 0
    
    @IBOutlet var tableViewMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToTable()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadDataToTable() {
        MoviesFacade.RetrieveInfo(mediaType: .nowPlaying, page: page) {
            (moviesResponse, error) in
            guard let resultMovies = moviesResponse?.movies,
                let totalPages = moviesResponse?.totalPages else {
                    return
            }
            self.movies.append(contentsOf: resultMovies)
            self.totalPages = totalPages
            self.tableViewMovies.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MovieTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.nameLabel?.text = movie.name
        cell.overviewLabel?.text = movie.overview
        cell.releaseDateLabel?.text = "Release date: \(movie.year)"
        cell.posterImage?.af_setImage(withURL: movie.poster, placeholderImage: #imageLiteral(resourceName: "poster-placeholder"), imageTransition: .curlDown(0.5))
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}

