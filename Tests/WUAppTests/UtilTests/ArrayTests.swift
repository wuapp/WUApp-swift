//
//  ArrayTests.swift
//  WUAppTests
//
//  Created by dengchunni on 20-9-10.
//  Copyright © 2020 Chunni. All rights reserved.
//

import XCTest
@testable import WUApp

class ArrayTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJoin() throws {
        let e = [].join(",", prefix: "(", suffix: ")")
        XCTAssertEqual("()", e)
        let s = [1,2,3].join(",")
        XCTAssertEqual(s, "1,2,3")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
