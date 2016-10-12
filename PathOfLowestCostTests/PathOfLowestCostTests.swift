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
    
    override func setUp() {
        super.setUp()
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
    
    
    func testDataWithTrueLowestCost() {
        let pathOfLowestCostCalculator = PathOfLowestCostCalculator()
        let result = pathOfLowestCostCalculator.calculateLowestCost(dataSet: dataSetWithTrueLowestCost)
        XCTAssertEqual(result.isPathPassable, true)
    }
    
    func testDataWithFalseLowestCost() {
        let pathOfLowestCostCalculator = PathOfLowestCostCalculator()
        let result = pathOfLowestCostCalculator.calculateLowestCost(dataSet: dataSetWithFalseLowestCost)
        XCTAssertEqual(result.isPathPassable, false)
    }
    
    func testDataWithTrueLowestCostHas16AsLowestCost() {
        let pathOfLowestCostCalculator = PathOfLowestCostCalculator()
        let result = pathOfLowestCostCalculator.calculateLowestCost(dataSet: dataSetWithTrueLowestCost)
        XCTAssertEqual(result.lowestCost, 16)
    }
    
    func testDataWithFalseLowestCostHas68AsLowestCost() {
        let pathOfLowestCostCalculator = PathOfLowestCostCalculator()
        let result = pathOfLowestCostCalculator.calculateLowestCost(dataSet: dataSetWithFalseLowestCost)
        XCTAssertEqual(result.lowestCost, 68)
    }

}
