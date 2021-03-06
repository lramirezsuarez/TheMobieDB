//
//  UpcomingViewController.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/3/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class UpcomingViewController: UIViewController, MediaViewControllerDelegate {
    var movies = [Movie]()
    var page = 1
    var totalPages = 0
    var refreshControl = UIRefreshControl()
    let segueIdentifier = "ShowSegue"
    
    @IBOutlet var tableViewMovies: MediaTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToTable()
        tableViewMovies.myListDelegate = self
        self.tableViewMovies.refreshControl = refreshControl
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(UpcomingViewController.refreshAction(sender:)), for: UIControlEvents.valueChanged)
        //containerView.addSubview(listViewCollection!)
        //configureList(list: listViewCollection!)
    }
    
    func loadDataToTable() {
        MoviesFacade.retrieveInfo(mediaType: .upcoming, page: page) {
            (moviesResponse, error) in
            guard let resultMovies = moviesResponse?.movies,
                let totalPages = moviesResponse?.totalPages else {
                    self.displayMessage(title: "Error", message: "\(error!)")
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
    
    func displayMessage(title: String, message : String) {
        let refreshAlert = UIAlertController(title: title,
                                             message: message,
                                             preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func getNumberOfCells() -> Int {
        return movies.count
    }
    
    func setupCell(cell: MovieCell, indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        cell.titleLabel?.text = movie.name
        cell.genreLabel?.text = movie.genre
        cell.overviewLabel?.text = movie.overview
        cell.releaseDateLabel?.text = "Release Date: \(movie.year)"
        let filter = RoundedCornersFilter(radius: 10.0)
        cell.posterImage?.af_setImage(withURL: (movie.poster), placeholderImage: #imageLiteral(resourceName: "poster-placeholder"), filter: filter, imageTransition: .flipFromTop(0.4))
        cell.ratingCosmos?.rating = movie.rating
    }
    
    func didSelectCell(cell: MovieCell, indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        newViewController.detail = movies[indexPath.row]
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
