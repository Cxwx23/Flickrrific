//
//  FlickrrificTests.swift
//  FlickrrificTests
//
//  Created by Cole Warner on 9/25/24.
//

import XCTest
import Foundation
@testable import Flickrrific

final class FlickrrificTests: XCTestCase {
    private var apiManager: ApiManagerType?
    var testResponse: ResponseModel?

    override func setUpWithError() throws {
        apiManager = MockAPIManager.mockShared
    }

    override func tearDownWithError() throws {
        apiManager = nil
    }

    func testGetDataTitles() throws {
        Task {
            do {
                testResponse = try await apiManager?.getData(type: ResponseModel.self, url: "")
                try await Task.sleep(nanoseconds: 1_000_000_000) 
                XCTAssertNotNil(testResponse)
            }
        }
        
        if let dataArray = testResponse?.items {
            XCTAssertEqual(dataArray[0].title, "Item 1")
            XCTAssertEqual(dataArray[1].title, "Item 2")
            XCTAssertEqual(dataArray[2].title, "Item 3")
        }
    }
    
    func testGetDataLinks() throws {
        Task {
            do {
                testResponse = try await apiManager?.getData(type: ResponseModel.self, url: "")
                try await Task.sleep(nanoseconds: 1_000_000_000)
                XCTAssertNotNil(testResponse)
            }
        }
        
        if let dataArray = testResponse?.items {
            XCTAssertEqual(dataArray[0].link, "Link 1")
            XCTAssertEqual(dataArray[1].link, "Link 2")
            XCTAssertEqual(dataArray[2].link, "Link 3")
        }
    }
    
    func testGetDataDescription() throws {
        Task {
            do {
                testResponse = try await apiManager?.getData(type: ResponseModel.self, url: "")
                try await Task.sleep(nanoseconds: 1_000_000_000)
                XCTAssertNotNil(testResponse)
            }
        }
        
        if let dataArray = testResponse?.items {
            XCTAssertEqual(dataArray[0].description, "Description 1")
            XCTAssertEqual(dataArray[1].description, "Description 2")
            XCTAssertEqual(dataArray[2].description, "Description 3")
        }
    }
    
    func testGetDataPublished() throws {
        Task {
            do {
                testResponse = try await apiManager?.getData(type: ResponseModel.self, url: "")
                try await Task.sleep(nanoseconds: 1_000_000_000)
                XCTAssertNotNil(testResponse)
            }
        }
        
        if let dataArray = testResponse?.items {
            XCTAssertEqual(dataArray[0].published, "2024-01-01")
            XCTAssertEqual(dataArray[1].published, "2024-01-02")
            XCTAssertEqual(dataArray[2].published, "2024-01-03")
        }
    }
    
    func testGetDataAuthor() throws {
        Task {
            do {
                testResponse = try await apiManager?.getData(type: ResponseModel.self, url: "")
                try await Task.sleep(nanoseconds: 1_000_000_000)
                XCTAssertNotNil(testResponse)
            }
        }
        
        if let dataArray = testResponse?.items {
            XCTAssertEqual(dataArray[0].author, "Author 1")
            XCTAssertEqual(dataArray[1].author, "Author 2")
            XCTAssertEqual(dataArray[2].author, "Author 3")
        }
    }
}
