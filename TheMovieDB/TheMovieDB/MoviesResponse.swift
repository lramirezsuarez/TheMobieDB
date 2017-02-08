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
    
    init (movies : [Movie]){
        self.movies = movies
        self.totalPages = 0
    }
    
    convenience init? (json : [String: AnyObject], genre : [String: AnyObject]) {
        self.init(movies : [])
        guard let results = json["results"] as? [[String : AnyObject]],
            let totalPages = json["total_pages"] as? Int,
            let resultGenre = genre["genres"] as? [[String : AnyObject]]
            else {
                return nil
        }
        self.totalPages = totalPages
        for result in results {
            let movie = parseMovie(result: result, resultGenre: resultGenre)
            self.movies.append(movie)
        }
    }
    
    func parseMovie(result : [String : AnyObject], resultGenre : [[String : AnyObject]]) -> Movie {
        guard let id = result["id"] as? Int,
            let name = result["title"] as? String,
            let overview = result["overview"] as? String,
            let year = result["release_date"] as? String,
            let rating = result["vote_average"] as? Double,
            let poster = result["poster_path"] as? String,
            let adult = result["adult"] as? Bool,
            let originalLanguage = result["original_language"] as? String,
            let background = result["backdrop_path"] as? String,
            let popularity = result["popularity"] as? Double,
            let votes = result["vote_count"] as? Int,
            let genres = result["genre_ids"] as? [Int]
            else {
                return Movie(id: 0, name: "", overview: "", year: "", rating: 0, poster: URL(string: "")!, adult: false, originalLanguage: "", background: URL(string: "")!, popularity: 0, votes: 0, genre: "")
        }
        let genreString = parseGenre(resultGenre: resultGenre, genres: genres)
        
        let posterURL = MediaSingleton.sharedInstance.imageURL+poster
        let backgroundURL = MediaSingleton.sharedInstance.imageURL+background
        let movie = Movie(id: id, name: name, overview: overview, year: year, rating: (rating*5/10), poster: URL(string: posterURL)!, adult: adult, originalLanguage: originalLanguage, background: URL(string: backgroundURL), popularity: Double(round(100*popularity)/100), votes: votes, genre: genreString)
        return movie
    }
    
    func parseGenre(resultGenre : [[String : AnyObject]], genres : [Int]) -> String {
        var genreString = ""
        for genreType in resultGenre {
            for genre in genres {
                let genreId = genreType["id"] as? Int
                let genreName = genreType["name"] as? String
                if genre == genreId {
                    genreString = genreString + genreName! + " | "
                }
            }
        }
        return genreString
    }
}
