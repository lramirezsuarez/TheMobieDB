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
    var adult : Bool { get }
    var originalLanguage : String { get }
    var background : URL? { get }
    var popularity : Double { get set }
    var votes : Int { get }
    var genre : String { get }
}

class Movie : NSObject, MediaInfo, NSCoding {
    var id : Int
    var name : String
    var overview : String
    var year : String
    var rating : Double
    var poster: URL
    var adult: Bool
    var originalLanguage: String
    var background: URL?
    var popularity: Double
    var votes: Int
    var genre: String
    
    init (id : Int, name : String, overview : String, year : String, rating : Double, poster : URL, adult : Bool, originalLanguage : String, background : URL?, popularity : Double, votes : Int, genre : String) {
        self.id = id
        self.name = name
        self.overview = overview
        self.year = year
        self.rating = rating
        self.poster = poster
        self.adult = adult
        self.originalLanguage = originalLanguage
        self.background = background
        self.popularity = popularity
        self.votes = votes
        self.genre = genre
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let id = aDecoder.decodeObject(forKey: "id") as? Int,
            let name = aDecoder.decodeObject(forKey: "name") as? String,
            let overview = aDecoder.decodeObject(forKey: "overview") as? String,
            let year = aDecoder.decodeObject(forKey: "year") as? String,
            let rating = aDecoder.decodeObject(forKey: "rating") as? Double,
            let poster = aDecoder.decodeObject(forKey: "poster") as? URL,
            let adult = aDecoder.decodeObject(forKey: "adult") as? Bool,
            let originalLanguage = aDecoder.decodeObject(forKey: "originalLanguage") as? String,
            let background = aDecoder.decodeObject(forKey: "background") as? URL,
            let popularity = aDecoder.decodeObject(forKey: "popularity") as? Double,
            let votes = aDecoder.decodeObject(forKey: "votes") as? Int,
            let genre = aDecoder.decodeObject(forKey: "genre") as? String
            else { return nil }
        self.init(
            id: id,
            name: name,
            overview: overview,
            year: year,
            rating: rating,
            poster: poster,
            adult: adult,
            originalLanguage: originalLanguage,
            background: background,
            popularity: popularity,
            votes: votes,
            genre: genre)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.overview, forKey: "overview")
        aCoder.encode(self.year, forKey: "year")
        aCoder.encode(self.rating, forKey: "rating")
        aCoder.encode(self.poster, forKey: "poster")
        aCoder.encode(self.adult, forKey: "adult")
        aCoder.encode(self.originalLanguage, forKey: "originalLanguage")
        aCoder.encode(self.background, forKey: "background")
        aCoder.encode(self.popularity, forKey: "name")
        aCoder.encode(self.votes, forKey: "votes")
        aCoder.encode(self.genre, forKey: "genre")
    }
}
