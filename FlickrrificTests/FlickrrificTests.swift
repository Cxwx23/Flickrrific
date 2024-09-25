//
//  FlickrrificTests.swift
//  FlickrrificTests
//
//  Created by Cole Warner on 9/25/24.
//

import XCTest
@testable import Flickrrific

final class FlickrrificTests: XCTestCase {
    private var apiManager: MockAPIManager?

    override func setUpWithError() throws {
        apiManager = MockAPIManager.mockShared
    }

    override func tearDownWithError() throws {
        apiManager = nil
    }

    func testGetItems() throws {
        var testResponse: ResponseModel?
        
        Task {
            do {
                testResponse = try await apiManager?.getData(type: ResponseModel.self, url: "")
            }
        }
        
        if let dataArray = testResponse?.items {
            XCTAssertEqual(dataArray[0].title, "Item 1")
            XCTAssertEqual(dataArray[1].title, "Item 2")
            XCTAssertEqual(dataArray[2].title, "Item 3")
        }
    }
}
