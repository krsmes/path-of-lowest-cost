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
    
    let dataSet1 = [[3, 4, 1, 2, 8, 6],
                    [6, 1, 8, 2, 7, 4],
                    [5, 9, 3, 9, 9, 5],
                    [8, 4, 1, 3, 2, 6],
                    [3, 7, 2, 8, 6, 4]]
    
    func testDataSet1() {
        let pathOfLowestCostCalculator = PathOfLowestCostCalculator()
        let result = pathOfLowestCostCalculator.calculateLowestCost(dataSet: dataSet1)
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, true)
    }
    
}
