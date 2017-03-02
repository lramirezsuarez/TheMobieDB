//
//  MediaSingleton.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/1/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

class MediaSingleton: NSObject, NSCoding {
    static let host : String = "https://api.themoviedb.org/3"
    static let apiKey : String = "1f4d7de5836b788bdfd897c3e0d0a24b"
    static let imageURL : String = "https://image.tmdb.org/t/p/w780/"
    var moviesFavorites : [Movie] = []
    //var movieGenres : [String: AnyObject] = [:]

    static let sharedInstance : MediaSingleton = {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: MediaSingleton.filePath) as? MediaSingleton {
            return ourData
        }
        return MediaSingleton()
    }()

    private static var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let movies = aDecoder.decodeObject(forKey: "moviesFavorites") as? [Movie]/*,
        let genres = aDecoder.decodeObject(forKey: "movieGneres") as? [String: AnyObject]*/
            else { return nil }
        self.moviesFavorites = movies
        //self.movieGenres = genres
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.moviesFavorites, forKey: "moviesFavorites")
        //aCoder.encode(self.movieGenres, forKey: "movieGenres")
    }
    
    private override init() {}
    
    func saveData() {
        NSKeyedArchiver.archiveRootObject(self, toFile: MediaSingleton.filePath)
    }
}
