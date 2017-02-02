//
//  MoviesResponse.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

class MoviesResponse {
    var movies : [Movie]
    var totalPages : Int
    
    init (movies : [Movie]){
        self.movies = movies
        self.totalPages = 0
    }
    
    convenience init? (json : [String: AnyObject]) {
        guard let results = json["results"] as? [[String : AnyObject]],
        let totalPages = json["total_pages"] as? Int
            else {
                return nil
        }
        self.init(movies : [])
        self.totalPages = totalPages
        
        for result in results {
            guard let id = result["id"] as? Int,
            let name = result["title"] as? String,
            let overview = result["overview"] as? String,
            let year = result["release_date"] as? String,
            let rating = result["vote_average"] as? Double,
            let poster = result["poster_path"] as? String
                else {
                    return
            }
            let posterURL = MediaSingleton.sharedInstance.imageURL+poster
            let movie = Movie(id: id, name: name, overview: overview, year: year, rating: rating, poster: URL(string : posterURL)!)
            self.movies.append(movie)
        }
    }
}
