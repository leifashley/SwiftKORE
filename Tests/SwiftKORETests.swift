//
//  SwiftKORETests.swift
//  SwiftKORETests
//
//  Created by Leif Ashley on 3/18/22.
//

import XCTest
@testable import SwiftKORE

class SwiftKORETests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var color = UIColor(hexString: "#FF000088")
        
        XCTAssert(color.red == 1.0, "Value of red")
        
        print("#HEX: \(color.hex)")
        print("#HEX: \(color.hexWithAlpha)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
