//
//  MediaType.swift
//  TheMovieDB
//
//  Created by Luis Ramirez on 1/27/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

enum MediaType {
    case nowPlaying
    case topRated
    case popular
    case upcoming
}

extension MediaType{
    var Route: String {
        switch self {
        case .nowPlaying: return "/movie/now_playing"
        case .popular : return "/movie/popular"
        case .topRated : return "/movie/top_rated"
        case .upcoming : return "/movie/upcoming"
        }
    }
    
}


