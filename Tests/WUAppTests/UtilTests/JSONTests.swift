//
//  JSONTests.swift
//  WUAppTests
//
//  Created by dengchunni on 20-9-10.
//  Copyright © 2020 Chunni. All rights reserved.
//

import XCTest
@testable import WUApp

class JSONTests: XCTestCase {
    
    struct Test:Codable {
        var name: String
        var age: Int
        var sub: TestSub
    }

    struct TestSub:Codable {
        var addr: [String]
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let s = JSON.test(p:1,2,"a")
        XCTAssertEqual(#"(1,2,"a")"#, s)
    }
    
    func testFromJSON() throws {
        let s = #"{"name":"Abby","age":3}"#
        let a = JSON.fromJSON(Test.self, s)
        XCTAssertEqual(a?.name, "abcd")
        XCTAssertEqual(a?.age, 3)
    }
    
    func testToJSON() throws {
        let t = Test(name: "Abby", age: 3,sub: TestSub(addr: ["a","b"]))
        let s = JSON.toJSON(t)
        XCTAssertEqual(#"{"name":"Abby","age":3,"sub":{"addr":["a","b"]}}"#, s)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
