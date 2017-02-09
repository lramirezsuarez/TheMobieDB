//
//  MovieCollectionViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/9/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var movies = [Movie]()
    var page = 1
    var totalPages = 0
    let segueIdentifier = "ShowSegue"
    
    @IBOutlet var collectionViewMovies : UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToCollection()

        // Do any additional setup after loading the view.
    }

    func loadDataToCollection() {
        MoviesFacade.RetrieveInfo(mediaType: .upcoming, page: page) {
            (moviesResponse, error) in
            guard let resultMovies = moviesResponse?.movies,
                let totalPages = moviesResponse?.totalPages else {
                    self.displayMessage(title: "Error", message: "\(error!)")
                    return
            }
            print(resultMovies)
            self.movies.append(contentsOf: resultMovies)
            self.totalPages = totalPages
            self.collectionViewMovies.reloadData()
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueIdentifier,
//            let destination = segue.destination as? MovieDetailViewController,
//            let movieIndex = collectionViewMovies.indexPathsForSelectedItems
//        {
//            destination.detail = movies[movieIndex]
//        }
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = self.collectionView.bounds.size.width
//        let height = self.collectionView.bounds.size.height
//        return CGSize(width: width/3, height: height/3)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "MovieCollectionViewCell"
        let cell = collectionViewMovies.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        let movie = movies[indexPath.row]
        print(movie)
        let filter = RoundedCornersFilter(radius: 10.0)
        
        cell.titleLabel.text = movie.name
        cell.posterImage.af_setImage(withURL: (movie.poster), placeholderImage: #imageLiteral(resourceName: "poster-placeholder"), filter: filter, imageTransition: .flipFromTop(0.4))
        cell.ratingCosmosView.rating = movie.rating
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        displayMessage(title: "Movie", message: "\(movies[indexPath.row].name)")
    }

    func displayMessage(title: String, message : String) {
        let refreshAlert = UIAlertController(title: title,
                                             message: message,
                                             preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(refreshAlert, animated: true, completion: nil)
    }

    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//    }
    /*

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
