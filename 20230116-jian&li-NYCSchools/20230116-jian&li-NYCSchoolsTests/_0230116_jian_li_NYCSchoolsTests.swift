//
//  _0230116_jian_li_NYCSchoolsTests.swift
//  20230116-jian&li-NYCSchoolsTests
//
//  Created by jianli on 1/16/23.
//

import XCTest
@testable import _0230116_jian_li_NYCSchools

final class _0230116_jian_li_NYCSchoolsTests: XCTestCase {
    
    var viewModel: SchoolListViewModel?
    
    override class func setUp() {
        super.setUp()
        // used mock data
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func test_NetworkManager() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        viewModel = SchoolListViewModel()
        viewModel?.networkManager = MockNetworkManager()
        viewModel?.loadMore()
        XCTAssert(((viewModel?.schools.isEmpty) != nil))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    @MainActor func test_load() {
        viewModel = SchoolListViewModel()
        viewModel?.networkManager = MockNetworkManager()
        XCTAssert(viewModel?.schools.count == 2)
    }

}
