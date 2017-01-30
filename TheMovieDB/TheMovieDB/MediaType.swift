//
//  MediaType.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/27/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

enum MediaType {
    case nowPlaying
    case topRated
    case popular
    case upcoming
}

struct MediaTypeCategory {
    var mediaType : MediaType
    
    func mediaTypeRoute(mediaType : MediaType)-> String {
        switch mediaType {
        case .nowPlaying: return "/movie/now_playing"
        case .popular : return "/movie/popular"
        case .topRated : return "/movie/top_rated"
        case .upcoming : return "/movie/upcoming"
        }
    }
}
