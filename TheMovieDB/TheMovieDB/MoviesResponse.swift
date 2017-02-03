//
//  MoviesResponse.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 1/30/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

class MoviesResponse {
    var movies : [Movie]
    var totalPages : Int
    var message : String
    
    init (movies : [Movie]){
        self.movies = movies
        self.totalPages = 0
        self.message = ""
    }
    
    convenience init? (json : [String: AnyObject]) {
        self.init(movies : [])
        guard let results = json["results"] as? [[String : AnyObject]],
            let totalPages = json["total_pages"] as? Int
            else {
                let statusCode = json["status_code"] as? Int
                let statusMessage = json["status_message"] as? String
                self.message = "\(statusCode): \(statusMessage)"
                return nil
        }        
        self.totalPages = totalPages
        for result in results {
            guard let id = result["id"] as? Int,
                let name = result["title"] as? String,
                let originalName = result["original_title"] as? String,
                let overview = result["overview"] as? String,
                let year = result["release_date"] as? String,
                let rating = result["vote_average"] as? Double,
                let poster = result["poster_path"] as? String,
                let adult = result["adult"] as? Bool,
                let originalLanguage = result["original_language"] as? String,
                let background = result["backdrop_path"] as? String,
                let popularity = result["popularity"] as? Double,
                let votes = result["vote_count"] as? Int,
                let genre = result["genre_ids"] as? [Int]
                else {
                    return
            }
            let posterURL = MediaSingleton.sharedInstance.imageURL+poster
            let backgroundURL = MediaSingleton.sharedInstance.imageURL+background
            let movie = Movie(id: id, name: name, originalName: originalName, overview: overview, year: year, rating: rating, poster: URL(string: posterURL)!, adult: adult, originalLanguage: originalLanguage, background: URL(string: backgroundURL), popularity: popularity, votes: votes, genre: genre)
            self.movies.append(movie)
        }
    }
}
