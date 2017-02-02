//
//  Movie.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 1/27/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

protocol MediaInfo {
    var id : Int { get }
    var name : String { get }
    var overview : String { get }
    var year : String { get }
    var rating : Double { get set}
    var poster : URL { get }
}

struct Movie : MediaInfo {
    var id : Int
    var name : String
    var overview : String
    var year : String
    var rating : Double
    var poster: URL
    
    init (id : Int, name : String, overview : String, year : String, rating : Double, poster : URL) {
        self.id = id
        self.name = name
        self.overview = overview
        self.year = year
        self.rating = rating
        self.poster = poster
    }
}
