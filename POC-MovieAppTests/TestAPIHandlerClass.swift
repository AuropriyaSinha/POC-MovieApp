//
//  TestAPIHandlerClass.swift
//  POC-MovieAppTests
//
//  Created by Auropriya Sinha on 20/09/22.
//

import XCTest
@testable import POC_MovieApp

class TestAPIHandlerClass: XCTestCase {
    

    func testValidStoriesReturnsSuccess() {
        let apiHandler = APIHandler()
        let expectation = self.expectation(description: "ValidRequest_Returns_Success")
        
        apiHandler.getTopStories { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertGreaterThan(arr.count, 0)
            case .failure(let e) :
                XCTAssertNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testInValidStoriesReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.topHeadLinesURL = URL(string:  "https://newsapi.org/v2/top-headlines?country=INDIA&apiKey=eda6154a62744b7bbad849130a7f7b6f")
        let expectation = self.expectation(description: "ValidRequest_Returns_Failure")
        
        apiHandler.getTopStories { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertEqual(arr.count, 0)
            case .failure(let e) :
                XCTAssertNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testInValidURLReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.topHeadLinesURL = URL(string:  "https://newsapi.org/v2/top-headlines?country=INDIA&apiKey=")
        let expectation = self.expectation(description: "InvalidURL_Returns_Failure")
        
        apiHandler.getTopStories { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertEqual(arr.count, 0)
            case .failure(let e) :
                XCTAssertNotNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testInvalidURLWithNumbersReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.topHeadLinesURL = URL(string:  "123")
        let expectation = self.expectation(description: "InvalidURL_Returns_Failure")
        
        apiHandler.getTopStories { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertEqual(arr.count, 0)
            case .failure(let e) :
                XCTAssertNotNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testValidSearchReturnsSuccess() {
        let apiHandler = APIHandler()
        let expectation = self.expectation(description: "Valid_Search_URL_Success")
        
        apiHandler.search(query: "Hello") { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertGreaterThan(arr.count, 0)
            case .failure(let e) :
                XCTAssertNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testInvalidSearchQueryReturnsFailure() {
        let apiHandler = APIHandler()
        
        apiHandler.search(query: " ") { result in
            XCTAssertNil(result)
        }
    }
    
    func testSearchWithInvalidURLReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.searchURLString = "123"
        let expectation = self.expectation(description: "InValid_Search_URL_Failure")
        
        apiHandler.search(query: "Hello") { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertGreaterThan(arr.count, 0)
            case .failure(let e) :
                XCTAssertNotNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testSearchWithInvalidURLInvalidQueryReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.searchURLString = "123"
        let expectation = self.expectation(description: "InValid_SearchandURL_Failure")
        
        apiHandler.search(query: "9") { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertEqual(arr.count, 0)
            case .failure(let e) :
                XCTAssertNotNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testBlankQueryBlankURLReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.searchURLString = " "
        
        apiHandler.search(query: " ") { result in
            XCTAssertNil(result)
        }
    }
    
    func testInvalidURLValidQueryReturnsFailure() {
        let apiHandler = APIHandler()
        apiHandler.searchURLString = "https://newsapi.org/v2/top-headlines?country=INDIA&apiKey="
        let expectation = self.expectation(description: "InvalidSearchURL_Returns_Failure")
        
        apiHandler.search(query: "A") { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let arr) :
                XCTAssertNotNil(arr)
                XCTAssertEqual(arr.count, 0)
            case .failure(let e) :
                XCTAssertNotNil(e)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }

}
