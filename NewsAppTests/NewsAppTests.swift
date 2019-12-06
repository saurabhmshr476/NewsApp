//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by SAURABH MISHRA on 07/12/19.
//  Copyright © 2019 SAURABH MISHRA. All rights reserved.
//

import XCTest

class NewsAppTests: XCTestCase {
    var sut: URLSession!

    override func setUp() {
        
        sut = URLSession(configuration: .default)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        sut = nil

        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 // Asynchronous test: for getting response from new york times API
    
    func testValidCallToiTunesGetsHTTPStatusCode200() {
      // given
      let url =
        URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=so0PGL5eAacoWY3OhLCzy6spxirjw3T0")
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url!) { data, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
