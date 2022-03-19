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
        print("#: \("test.value".localized)")
        
        var color = UIColor(hexString: "#FF0000")
        
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        color.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        
        print("#: \(fRed), \(fBlue), \(fGreen) - \(fAlpha)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
