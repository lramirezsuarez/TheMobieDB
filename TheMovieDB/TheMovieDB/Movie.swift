//
//  Movie.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/27/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

protocol MediaInfo {
    var id : Int { get }
    var name : String { get }
    var overview : String { get }
    var year : Int { get }
    var rating : Int { get set}
    var poster : URL { get }
}

struct Movie : MediaInfo {
    var id : Int
    var name : String
    var overview : String
    var year : Int
    var rating : Int
    var poster: URL
    
    init (id : Int, name : String, overview : String, year : Int, rating : Int, poster : URL) {
        self.id = id
        self.name = name
        self.overview = overview
        self.year = year
        self.rating = rating
        self.poster = poster
    }
}
