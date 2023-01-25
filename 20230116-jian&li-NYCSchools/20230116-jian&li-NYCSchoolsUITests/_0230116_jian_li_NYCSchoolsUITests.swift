//
//  _0230116_jian_li_NYCSchoolsUITests.swift
//  20230116-jian&li-NYCSchoolsUITests
//
//  Created by jianli on 1/16/23.
//

import XCTest

final class _0230116_jian_li_NYCSchoolsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sleep(3)
        print("start debug UI Test")
        // jump to first school, this school no SAT Score
        let tablesQuery = app.tables
        tablesQuery.element(boundBy: 0).cells.element(boundBy: 1).tap()
        sleep(3)
        let element = app.windows.element
        element.swipeDown()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
