//
//  MoviesFacadeTest.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 2/22/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import TheMovieDB

class MoviesFacadeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSuccesFetchingData(){
        let mockPage = 1
        let mockResults = [Movie]()
        let mockTotalResults = 20
        let mockTotalPages = 2
        
        stub(condition: isHost("api.themoviedb.org")) { _ in
            let mockMovieResponse: [String : Any] = [
                "page" : mockPage,
                "results" : mockResults,
                "total_results" : mockTotalResults,
                "total_pages" : mockTotalPages
            ]
            return OHHTTPStubsResponse(jsonObject: mockMovieResponse,
                                       statusCode: 200,
                                       headers: nil)
        }
        
        let waitingForService = expectation(description: "getting movie response")
        
        MoviesFacade.RetrieveInfo(mediaType: .popular, page: 1){ response,error in
            guard let movieReponse = response else{
                XCTFail("Could not parse correctly. Debug!!")
                return
            }
            waitingForService.fulfill()
            XCTAssertEqual(movieReponse.totalPages, mockTotalPages)
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
    
    func testNotInternetConnection() {
        stub(condition: isHost("api.themoviedb.org")) { _ in
            return OHHTTPStubsResponse(error: NSError(domain: NSURLErrorDomain,
                                                      code: NSURLErrorNotConnectedToInternet,
                                                      userInfo: nil))
        }
        let waitingForService = expectation(description: "getting movie response")
        
        MoviesFacade.RetrieveInfo(mediaType: .popular, page: 1) { response, error in
            guard let moviesError = error else {
                XCTFail("something wrong")
                return
            }
            print("not connected to internet. \(moviesError)")
//            switch $0 {
//            case .notConnectedToInternet:
//                print("not conected to internet")
//            default:
//                XCTFail("something wrong dude")
//            }
            waitingForService.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
