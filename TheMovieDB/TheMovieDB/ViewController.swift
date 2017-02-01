//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var movies = [Movie]()
    var page = 1
    var totalPages = 0
    var array : [String] = ["1","2","3","4","5"]
    
    @IBOutlet var tableViewMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoviesFacade.RetrieveInfo(mediaType: .upcoming, page: page) {
            (moviesResponse, error) in
            guard let resultMovies = moviesResponse?.movies,
                let totalPages = moviesResponse?.totalPages else {
                    return
            }
            print(resultMovies)
            self.movies.append(contentsOf: resultMovies)
            self.totalPages = totalPages
            self.tableViewMovies.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MovieTableViewCell"//
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
//
//        let movie = movies[indexPath.row]
//        
//        cell.nameLabel?.text = movie.name
        cell.nameLabel.text = array[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    


}

