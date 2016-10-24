//
//  PathOfLowestCostCalculator.swift
//  PathOfLowestCost
//
//  Created by Sheila Wallace on 10/12/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import Foundation

let MinimumRowCount = 1
let MaximumRowCount = 10
let MinimumColumnCount = 5
let MaximumColumnCount = 100

class PathOfLowestCostCalculator {
    
    private let abandonPathValue = 50
    private var dataSet: [[Int]] = [[]]
    private var rowCount = 0
    private var columnCount = 0
    private var computedResults: [[PathOfLowestCostResult]] = []
    
    func calculateLowestCost(dataSet: [[Int]]) -> PathOfLowestCostResult {
        self.dataSet = dataSet
        rowCount = dataSet.count
        if rowCount < MinimumRowCount || rowCount > MaximumRowCount {
            let result = PathOfLowestCostResult(isPathPassable: false, lowestCost: 0, path: [])
            result.dataSetFailedForInvalidNumberOfRows()
            return result
        }
        columnCount = dataSet[0].count
        if (columnCount < MinimumColumnCount || columnCount > MaximumColumnCount) {
            let result = PathOfLowestCostResult(isPathPassable: false, lowestCost: 0, path: [])
            result.dataSetFailedForInvalidNumberOfColumns()
            return result
        }
        
        setupComputedResults()
        
        var lowestResult = PathOfLowestCostResult(isPathPassable: false, lowestCost: Int.max, path: [])
        
        for rowIndex in 0 ..< rowCount {
            let rowCost = lowestCost(row: rowIndex, column: columnCount - 1)
            if rowCost.lowestCost < lowestResult.lowestCost {
                lowestResult = rowCost
            }
        }
        
        return lowestResult
    }
    
    fileprivate func lowestCost(row: Int, column: Int) -> PathOfLowestCostResult {
        let rowAbove = row == 0 ? rowCount - 1 : row - 1
        let rowBelow = row == rowCount - 1 ? 0 : row + 1
        
        if column > 0 {
            let resultForRowAbove = cost(row: rowAbove, column: column-1)
            let resultForRow = cost(row: row, column: column-1)
            let resultForRowBelow = cost(row: rowBelow, column: column-1)
            
            if resultForRowAbove.lowestCost < resultForRow.lowestCost && resultForRowAbove.lowestCost < resultForRowBelow.lowestCost {
                return shouldAbandon(result: resultForRowAbove, valueForRowColumn: dataSet[row][column], row: row)
            } else if resultForRow.lowestCost < resultForRowBelow.lowestCost  {
                return shouldAbandon(result: resultForRow, valueForRowColumn: dataSet[row][column], row: row)
            } else {
                return shouldAbandon(result: resultForRowBelow, valueForRowColumn: dataSet[row][column],  row: row)
            }
        } else {
            return lowestCost(row: row)
        }
    }
    
    fileprivate func shouldAbandon(result: PathOfLowestCostResult, valueForRowColumn: Int, row: Int) -> PathOfLowestCostResult {
        if (result.lowestCost + valueForRowColumn > abandonPathValue || !result.isPathPassable) {
            return PathOfLowestCostResult(isPathPassable: false, lowestCost: result.lowestCost, path: result.path)
        }
        return PathOfLowestCostResult(isPathPassable: true, lowestCost: result.lowestCost + valueForRowColumn, path: result.path + [row+1])
    }
    
    fileprivate func lowestCost(row: Int) -> PathOfLowestCostResult {
        let rowAbove = row == 0 ? rowCount - 1 : row - 1
        let rowBelow = row == rowCount - 1 ? 0 : row + 1

        let costAbove = dataSet[rowAbove][0]
        let costInRow = dataSet[row][0]
        let costBelow = dataSet[rowBelow][0]
        
        if costAbove < costInRow && costAbove < costBelow {
            return PathOfLowestCostResult(isPathPassable: costAbove <= abandonPathValue, lowestCost: costAbove, path: [rowAbove+1])
        } else if costInRow < costBelow {
            return PathOfLowestCostResult(isPathPassable: costInRow <= abandonPathValue, lowestCost: costInRow, path: [row+1])
        } else {
            return PathOfLowestCostResult(isPathPassable: costBelow <= abandonPathValue, lowestCost: costBelow, path: [rowBelow+1])
        }
    }
    
    fileprivate func setupComputedResults() {
        computedResults = []
        for _ in 0 ..< rowCount {
            var columnResults: [PathOfLowestCostResult] = []
            for _ in 0 ..< columnCount {
                columnResults.append(PathOfLowestCostResult(isPathPassable: false, lowestCost: -1, path: []))
            }
            computedResults.append(columnResults)
        }
    }
    
    fileprivate func cost(row: Int, column: Int) -> PathOfLowestCostResult {
        if computedResults[row][column].lowestCost > -1 {
            return computedResults[row][column]
        } else {
            let result = lowestCost(row: row, column: column)
            computedResults[row][column] = result
            return result
        }
    }
    
}
