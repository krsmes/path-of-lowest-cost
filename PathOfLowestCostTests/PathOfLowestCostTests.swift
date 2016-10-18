//
//  PathOfLowestCostTests.swift
//  PathOfLowestCostTests
//
//  Created by Sheila Wallace on 10/12/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

let megaDataSetColumns = 100
let megaDataSetRows = 10

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
    
    let largeDataSet =
        [[3, 4, 1, 2, 8, 6, 6, 9, 9, 3, 3],
         [6, 1, 8, 2, 7, 4, 9, 4, 6, 5, 8],
         [5, 9, 3, 9, 9, 5, 8, 7, 8, 6, 9],
         [8, 4, 1, 3, 2, 6, 4, 9, 4, 7, 1],
         [5, 7, 2, 1, 2, 3, 1, 9, 2, 1, 8],
         [9, 8, 7, 4, 6, 5, 9, 0, 8, 6, 7],
         [9, 8, 9, 5, 7, 6, 4, 2, 9, 9, 0],
         [5, 6, 8, 13, 8, 9, 3, 1, 1, 6, 8],
         [5, 4, 8, 2, 4, 1, 2, 5, 7, 9, 7]]
    
    var megaDataSet: [[Int]] = {
        var dataSet: [[Int]] = []
        for rowIndex in 0 ..< megaDataSetRows {
            var row: [Int] = []
            for columnIndex in 0 ..< megaDataSetColumns {
                row.append(rowIndex == 0 ? 0 : 10)
            }
            dataSet.append(row)
        }
        return dataSet
    }()
    
    var tooManyRowsDataSet:  [[Int]] = {
        var dataSet: [[Int]] = []
        for rowIndex in 0 ..< MaximumRowCount + 1 {
            var row: [Int] = []
            for columnIndex in 0 ..< 10 {
                row.append(rowIndex == 0 ? 0 : 10)
            }
            dataSet.append(row)
        }
        return dataSet
    }()
    
    let notEnoughColumnsDataSet = [[1, 2, 3]]
    
    var tooManyColumnsDataSet:  [[Int]] = {
        var dataSet: [[Int]] = []
        for rowIndex in 0 ..< 2 {
            var row: [Int] = []
            for columnIndex in 0 ..< MaximumColumnCount + 1 {
                row.append(rowIndex == 0 ? 0 : 10)
            }
            dataSet.append(row)
        }
        return dataSet
    }()
    
    let dataSetWithNegativeNumbers =
        [[-3, 4, 1, 2, 1, 6],
         [6, -1, 8, -2, 7, 1],
         [5, 9, -3, 9, 9, 5],
         [8, 4, 1, 3, 2, 6],
         [3, 7, 2, 8, 6, 4]]

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
    
    func testLargeDataSetReturnsTrueForPassable() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: largeDataSet)
        XCTAssertEqual(result.isPathPassable, true)
    }
    
    func testLargeDataSetReturnsCorrectValueForLowestCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: largeDataSet)
        XCTAssertEqual(result.lowestCost, 20)
    }
    
    func testLargeDataSetReturnsCorrectPath() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: largeDataSet)
        XCTAssertEqual(result.path, [1, 2, 3, 4, 5, 5, 5, 6, 5, 5, 4])
    }
    
    func testMegaDataSetReturnsTrue() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: megaDataSet)
        XCTAssertEqual(result.isPathPassable, true)
    }
    
    func testMegaDataSetReturnsCorrectCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: megaDataSet)
        XCTAssertEqual(result.lowestCost, 0)
    }
    
    func testMegaDataSetReturnsCorrectPath() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: megaDataSet)
        var path: [Int] = []
        for _ in 0 ..< megaDataSetColumns {
            path.append(0)
        }
        XCTAssertEqual(result.path, result.path)
    }
    
    func testCalculateTwiceResetsStoredCosts() {
        let _ = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithTrueLowestCost)
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithFalseLowestCost)
        XCTAssertEqual(result.path, [1, 1, 1])
    }
    
    func testNotEnoughRows() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: [])
        XCTAssertEqual(result.lowestCost, InvalidNumberOfRowsCost)
    }
    
    func testTooManyRows() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: tooManyRowsDataSet)
        XCTAssertEqual(result.lowestCost, InvalidNumberOfRowsCost)
    }
    
    func testNotEnoughColumns() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: notEnoughColumnsDataSet)
        XCTAssertEqual(result.lowestCost, InvalidNumberOfColumnsCost)
    }
    
    func testTooManyColumns() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: notEnoughColumnsDataSet)
        XCTAssertEqual(result.lowestCost, InvalidNumberOfColumnsCost)
    }
    
    func testDataSetWithNegativeNumbersIsPassable() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithNegativeNumbers)
        XCTAssertEqual(result.isPathPassable, true)
    }
    
    func testDataSetWithNegativeNumbersHasCorrectCost() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithNegativeNumbers)
        XCTAssertEqual(result.lowestCost, -7)
    }
    
    func testDataSetWithNegativeNumbersHasCorrectPath() {
        let result = pathOfLowestCostCalculator!.calculateLowestCost(dataSet: dataSetWithNegativeNumbers)
        XCTAssertEqual(result.path, [1, 2, 3, 2, 1, 2])
    }
}
