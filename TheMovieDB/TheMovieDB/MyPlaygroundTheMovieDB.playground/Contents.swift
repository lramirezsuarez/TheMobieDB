//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

func jsonParser (data: Any) {
    var movies = [String]()
    if let json = data as? [String : Any], let results = json["results"] as? [[String : Any]] else {
        for result in results {
            if let title = result["title"] as? String {
                movies.append(title)
            }
        }
    }
    print(movies.count)
}

Alamofire.request("https://api.themoviedb.org/3/movie/now_playing?api_key=1f4d7de5836b788bdfd897c3e0d0a24b").responseJSON {
    response in
    print(response.result.value)
    print(response.response)
    
    if let data = response.result.value {
        jsonParser(data: data)
    }
    
    PlaygroundPage.current.finishExecution()
}