//
//  RegexTests.swift
//  WUAppTests
//
//  Created by dengchunni on 20-9-8.
//  Copyright © 2020 Chunni. All rights reserved.
//

import XCTest
import Foundation
@testable import WUApp

class RegexTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoesMatch() throws {
        let s = "daf"
        var r = s.doesMatch("^af")
        XCTAssertFalse(r)
        r = s.doesMatch("af")
        XCTAssertTrue(r)
        
    }
    
    func testFindFirst() throws {
        let s = "d中文afabcabcabc"
        let r = s.findFirst("bc")
        XCTAssertEqual("bc", r)
    }
    
    func testFindAll() throws {
        let s = "d中文afabcabcabc"
        let r = s.findAll("bc")
        XCTAssertEqual(["bc","bc","bc"], r)
        
    }
    
    func testFindAllWithGroup() throws {
        let s = "d中文afabcabcabc"
        let r = s.findAllWithGroup("(b)(c)")
        XCTAssertEqual([["bc","b","c"],["bc","b","c"],["bc","b","c"]], r)
        
    }
    
    func testReplace() throws {
        let s = "d中文afabcabcabc"
        let r = s.replace("bc", replacement: "de")
        XCTAssertEqual("d中文afadeadeade", r)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
