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
    var originalName : String { get }
    var overview : String { get }
    var year : String { get }
    var rating : Double { get set}
    var poster : URL { get }
    var adult : Bool { get }
    var originalLanguage : String { get }
    var bakground : URL? { get }
    var popularity : Double { get set }
    var votes : Int { get }
    var genre : String { get }
}

struct Movie : MediaInfo {
    var id : Int
    var name : String
    var originalName: String
    var overview : String
    var year : String
    var rating : Double
    var poster: URL
    var adult: Bool
    var originalLanguage: String
    var bakground: URL?
    var popularity: Double
    var votes: Int
    var genre: String
    
    init (id : Int, name : String, originalName : String, overview : String, year : String, rating : Double, poster : URL, adult : Bool, originalLanguage : String, background : URL?, popularity : Double, votes : Int, genre : String) {
        self.id = id
        self.name = name
        self.originalName = originalName
        self.overview = overview
        self.year = year
        self.rating = rating
        self.poster = poster
        self.adult = adult
        self.originalLanguage = originalLanguage
        self.bakground = background
        self.popularity = popularity
        self.votes = votes
        self.genre = genre
    }
}
