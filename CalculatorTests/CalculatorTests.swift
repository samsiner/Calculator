//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Sam Siner on 10/2/20.
//  Copyright © 2020 Sam Siner. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = ViewController()
    }
    
    func testOnePlusOneEqualsTwoThenClear() throws {
        viewController.clear(UIButton())
        viewController.one(UIButton())
        viewController.add(UIButton())
        viewController.one(UIButton())
        XCTAssertEqual(viewController.text, "1", "text should say 1")
        viewController.equals(UIButton())
        XCTAssertEqual(viewController.text, "2", "text should say 2")
        viewController.clear(UIButton())
        XCTAssertEqual(viewController.text, "0", "text should say 0")
    }
    
    func testDotAfterDotDoesNothing() throws {
        viewController.clear(UIButton())
        viewController.one(UIButton())
        viewController.dot(UIButton())
        viewController.two(UIButton())
        XCTAssertEqual(viewController.text, "1.2", "text should say 1.2")
        viewController.dot(UIButton())
        XCTAssertEqual(viewController.text, nil, "text should still say 1.2")
    }
    
    func testNinetyOneMinusOneEqualsNinetyThenSinEqualsOne() throws {
        viewController.clear(UIButton())
        viewController.nine(UIButton())
        viewController.one(UIButton())
        viewController.subtract(UIButton())
        viewController.one(UIButton())
        viewController.equals(UIButton())
        XCTAssertEqual(viewController.text, "90", "text should say 90")
        viewController.sinFunction(UIButton())
        XCTAssertEqual(viewController.text, "1", "text should still say 1")
    }
    
    func testIgnoreLeadingZero() throws {
        viewController.clear(UIButton())
        viewController.zero(UIButton())
        viewController.one(UIButton())
        XCTAssertEqual(viewController.text, "1", "text should say 1")
    }
    
    func testSecondOperatorShowsTotal() throws {
        viewController.clear(UIButton())
        viewController.five(UIButton())
        viewController.dot(UIButton())
        viewController.two(UIButton())
        viewController.add(UIButton())
        viewController.one(UIButton())
        viewController.dot(UIButton())
        viewController.four(UIButton())
        XCTAssertEqual(viewController.text, "1.4", "text should say 1.4")
        viewController.add(UIButton())
        XCTAssertEqual(viewController.text, "6.6", "text should say 6.6")
        viewController.dot(UIButton())
        viewController.four(UIButton())
        viewController.equals(UIButton())
        XCTAssertEqual(viewController.text, "7", "text should say 7")
    }
    
    func testTrigFunctionBeforeOperandDoesNothing() throws {
        viewController.clear(UIButton())
        viewController.sinFunction(UIButton())
        viewController.seven(UIButton())
        XCTAssertEqual(viewController.text, "7", "text should say 7")
    }
}
