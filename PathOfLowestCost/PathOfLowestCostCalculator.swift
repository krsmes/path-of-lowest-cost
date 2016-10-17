//
//  PathOfLowestCostCalculator.swift
//  PathOfLowestCost
//
//  Created by Sheila Wallace on 10/12/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import Foundation

class PathOfLowestCostCalculator {
    
    let abandonPathValue = 50
    var dataSet: [[Int]] = [[]]
    var rowCount = 0
    var columnCount = 0
    
    func calculateLowestCost(dataSet: [[Int]]) -> PathOfLowestCostResult {
        self.dataSet = dataSet
        rowCount = dataSet.count
        columnCount = dataSet[0].count
        
        var lowestResult = PathOfLowestCostResult(isPathPassable: false, lowestCost: Int.max, path: [])
        
        for rowIndex in 0 ..< rowCount {
            let lowestCostResult = lowestCostAtPosition(column: columnCount - 1, row: rowIndex)
            if lowestCostResult.lowestCost < lowestResult.lowestCost {
                lowestResult = lowestCostResult
            }
        }
        
        return (lowestResult)
    }
    
    func lowestCostAtPosition(column: Int, row: Int) -> PathOfLowestCostResult {
        let rowAbove = row == 0 ? rowCount - 1 : row - 1
        let rowBelow = row == rowCount - 1 ? 0 : row + 1
        
        if column > 0 {
            let resultForRowAbove = lowestCostAtPosition(column: column-1, row: rowAbove)
            let resultForRow = lowestCostAtPosition(column: column-1, row: row)
            let resultForRowBelow = lowestCostAtPosition(column: column-1, row: rowBelow)
            
            if resultForRowAbove.lowestCost < resultForRow.lowestCost && resultForRowAbove.lowestCost < resultForRowBelow.lowestCost {
                return shouldAbandon(result: resultForRowAbove, valueForRowColumn: dataSet[row][column], row: row)
            } else if resultForRow.lowestCost < resultForRowBelow.lowestCost  {
                return shouldAbandon(result: resultForRow, valueForRowColumn: dataSet[row][column], row: row)
            } else {
                return shouldAbandon(result: resultForRowBelow, valueForRowColumn: dataSet[row][column],  row: row)
            }
        } else {
            return lowestCostInFirstColumn(row: row)
        }
    }
    
    func shouldAbandon(result: PathOfLowestCostResult, valueForRowColumn: Int, row: Int) -> PathOfLowestCostResult {
        if (result.lowestCost + valueForRowColumn > abandonPathValue || !result.isPathPassable) {
            return PathOfLowestCostResult(isPathPassable: false, lowestCost: result.lowestCost, path: result.path)
        }
        return PathOfLowestCostResult(isPathPassable: true, lowestCost: result.lowestCost + valueForRowColumn, path: result.path + [row+1])
    }
    
    func lowestCostInFirstColumn(row: Int) -> PathOfLowestCostResult {
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
    
}
