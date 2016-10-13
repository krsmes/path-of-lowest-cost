//
//  PathOfLowestCostTests.swift
//  PathOfLowestCostTests
//
//  Created by Sheila Wallace on 10/12/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

class PathOfLowestCostTests: XCTestCase {
    
    var pathOfLowestCostCalculator: PathOfLowestCostCalculator?
    
    override func setUp() {
        super.setUp()
        pathOfLowestCostCalculator = PathOfLowestCostCalculator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    let dataSetWithTrueLowestCost =
        [[3, 4, 1, 2, 8, 6],
         [6, 1, 8, 2, 7, 4],
         [5, 9, 3, 9, 9, 5],
         [8, 4, 1, 3, 2, 6],
         [3, 7, 2, 8, 6, 4]]
    
    
    let dataSetWithFalseLowestCost =
        [[19, 10, 19, 10, 19],
         [21, 23, 20, 19, 12],
         [20, 12, 20, 11, 10]]
    
    let dataSetWithWrapping =
        [[3, 4, 1, 2, 8, 6],
         [6, 1, 8, 2, 7, 4],
         [5, 9, 3, 9, 9, 5],
         [8, 4, 1, 3, 2, 6],
         [3, 7, 2, 1, 2, 3]]
    
    
    func testDataWithTrueLowestCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithTrueLowestCost)
        XCTAssertEqual(result.isPathPassable, true)
    }
    
    func testDataWithFalseLowestCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithFalseLowestCost)
        XCTAssertEqual(result.isPathPassable, false)
    }
    
    func testDataWithTrueLowestCostHas16AsLowestCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithTrueLowestCost)
        XCTAssertEqual(result.lowestCost, 16)
    }
    
    func testDataWithFalseLowestCostHas68AsLowestCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithFalseLowestCost)
        XCTAssertEqual(result.lowestCost, 48)
    }
    
    func testDataWithWrapping() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithWrapping)
        XCTAssertEqual(result.isPathPassable, true)
    }
    
    func testDataWithWrappingHas11AsLowestCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithWrapping)
        XCTAssertEqual(result.lowestCost, 11)
    }
    
    func testDataWithTrueLowestCostReturnsLowestCostPath() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithTrueLowestCost)
        XCTAssertEqual(result.path, [1, 2, 3, 4, 4, 5])
    }
    
    func testDataWithFalseLowestCostReturnsLowestCostPath() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithFalseLowestCost)
        XCTAssertEqual(result.path, [1, 1, 1])
    }
    
    func testDataWithWrappingReturnsLowestCostPath() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithWrapping)
        XCTAssertEqual(result.path, [1, 2, 1, 5, 5, 5])
    }

}
