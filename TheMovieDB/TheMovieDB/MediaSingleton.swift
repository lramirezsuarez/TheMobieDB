//
//  MediaSingleton.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 2/1/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

class MediaSingleton {
    
    static let sharedInstance = MediaSingleton()
    
    let host : String = "https://api.themoviedb.org/3"
    let apiKey : String = "1f4d7de5836b788bdfd897c3e0d0a24b"
    let imageURL : String = "https://image.tmdb.org/t/p/w780/"
    
    private init() {}
}
