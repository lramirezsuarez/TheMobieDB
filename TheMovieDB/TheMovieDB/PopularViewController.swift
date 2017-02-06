//
//  PopularViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/3/17.
//  Copyright © 2017 Globant. All rights reserved.
//


import UIKit
import AlamofireImage

class PopularViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        self.refreshControl.addTarget(self, action: #selector(NowPlayingViewController.refreshAction(sender:)), for: UIControlEvents.valueChanged)
    }
    
    func loadDataToTable() {
        MoviesFacade.RetrieveInfo(mediaType: .popular, page: page) {
            (moviesResponse, error) in
            guard let resultMovies = moviesResponse?.movies,
                let totalPages = moviesResponse?.totalPages else {
                    let errorCode = error?.code
                    let errorDescription = error?.localizedDescription
                    self.displayMessage(title: "\(errorCode)", message: errorDescription!)
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
        
        cell.nameLabel.text = movie.name
        cell.genreLabel.text = movie.genre
        cell.overviewLabel.text = movie.overview
        cell.releaseDateLabel.text = "Release date: \(movie.year)"
        
        let filter = RoundedCornersFilter(radius: 10.0)
        
        cell.posterImage.af_setImage(withURL: movie.poster, placeholderImage: #imageLiteral(resourceName: "poster-placeholder"),
                                     filter: filter, imageTransition: .flipFromBottom(0.5))
        cell.ratingLabel.text = "\(movie.rating)/10"
        
        return cell
    }
    
    func displayMessage(title: String, message : String) {
        let refreshAlert = UIAlertController(title: title,
                                             message: message,
                                             preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(refreshAlert, animated: true, completion: nil)
    }
}
