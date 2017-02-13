//
//  MovieCollectionViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/9/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewController: UIViewController {
    var movies = [Movie]()
    var page = 1
    var totalPages = 0
    let segueIdentifier = "ShowSegue"
    var refreshControl = UIRefreshControl()
    
    @IBOutlet var collectionViewMovies : UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToCollection()
        self.collectionViewMovies.refreshControl = refreshControl
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(MovieCollectionViewController.refreshAction(sender:)), for: UIControlEvents.valueChanged)
    }

    func loadDataToCollection() {
        MoviesFacade.RetrieveInfo(mediaType: .upcoming, page: page) {
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
            self.collectionViewMovies.reloadData()
        }
    }
    
    func refreshAction(sender: UIRefreshControl) {
        self.page = 1
        self.movies.removeAll()
        self.collectionViewMovies.reloadData()
        self.loadDataToCollection()
    }
    
    func displayMessage(title: String, message : String) {
        let refreshAlert = UIAlertController(title: title,
                                             message: message,
                                             preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(refreshAlert, animated: true, completion: nil)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == segueIdentifier,
                let destination = segue.destination as? MovieDetailViewController,
                let movieIndex = collectionViewMovies.indexPathsForSelectedItems?.first
            {
                destination.detail = movies[movieIndex.item]
            }
        }
}


extension MovieCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "MovieCollectionViewCell"
        let cell = collectionViewMovies.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        let movie = movies[indexPath.row]
        let filter = RoundedCornersFilter(radius: 10.0)
        
        cell.titleLabel.text = movie.name
        cell.posterImage.af_setImage(withURL: (movie.poster), placeholderImage: #imageLiteral(resourceName: "poster-placeholder"), filter: filter, imageTransition: .flipFromTop(0.4))
        cell.ratingCosmosView.rating = movie.rating
        
        return cell
    }
    

}
