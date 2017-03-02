//
//  MoviesFavoritesFacade.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/23/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

protocol MoviesFavoritesProtocol {
    static func addMovieToFavorites(movie: Movie)
    static func searchMovie(movie: Movie) -> Bool
}

struct MoviesFavoritesFacade : MoviesFavoritesProtocol {
    
    static func addMovieToFavorites(movie: Movie) {
        if !searchMovie(movie: movie) {
            MediaSingleton.sharedInstance.moviesFavorites.append(movie)
            MediaSingleton.sharedInstance.saveData()
        }
    }
    
    static func searchMovie(movie : Movie) -> Bool {
        var isFavorite : Bool = false
        for moviesFavorite in MediaSingleton.sharedInstance.moviesFavorites {
            if movie.id == moviesFavorite.id {
                isFavorite = true
            }
        }
        return isFavorite
    }
}
