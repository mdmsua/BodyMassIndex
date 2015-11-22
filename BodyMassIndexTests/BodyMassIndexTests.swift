//
//  BodyMassIndexTests.swift
//  BodyMassIndexTests
//
//  Created by Dmytro Morozov on 21.11.15.
//  Copyright © 2015 Dmytro Morozov. All rights reserved.
//

import XCTest
@testable import BodyMassIndex

class BodyMassIndexTests: XCTestCase {
    
    let indexer = Indexer()
    
    func testShouldReturnNilWhenHeighIsZero() {
        let actual = indexer.calculate(1, height: 0)
        print(actual)
        XCTAssertNil(actual)
    }
    
    func testShouldCalculateBodyMassIndexForMetricSystem() {
        let expected = 1.0
        let actual = indexer.calculate(1, height: 1)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldCalculateBodyMassIndexForImperialSystem() {
        let expected = 703.0
        let actual = indexer.calculate(1, height: 1, metric: false)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnVerySeverelyUnderweightCategory() {
        let expected = Category.VerySeverelyUnderweight
        let actual = indexer.categorize(1)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnSeverelyUnderweightCategory() {
        let expected = Category.SeverelyUnderweight
        let actual = indexer.categorize(15)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnUnderweightCategory() {
        let expected = Category.Underweight
        let actual = indexer.categorize(18)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnNormalCategory() {
        let expected = Category.Normal
        let actual = indexer.categorize(21)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnOverweightCategory() {
        let expected = Category.Overweight
        let actual = indexer.categorize(27)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnModeratelyObeseCategory() {
        let expected = Category.ModeratelyObese
        let actual = indexer.categorize(32)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnSeverelyObeseCategory() {
        let expected = Category.SeverelyObese
        let actual = indexer.categorize(37)
        XCTAssertEqual(expected, actual)
    }
    
    func testShouldReturnVerySeverelyObeseCategory() {
        let expected = Category.VerySeverelyObese
        let actual = indexer.categorize(47)
        XCTAssertEqual(expected, actual)
    }
    
}
