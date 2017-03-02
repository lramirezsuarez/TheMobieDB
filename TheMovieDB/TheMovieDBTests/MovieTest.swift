//
//  MovieTest.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MovieTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieExist() {
        if let movie = Movie(id: 0, name: "", overview: "", year: "", rating: 0, poster: URL(string: "")!, adult: false, originalLanguage: "", background: URL(string: ""), popularity: 0, votes: 0, genre: "") as Movie? {
            XCTAssertNotNil(movie, "Movie exists")
        }
        XCTFail()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
