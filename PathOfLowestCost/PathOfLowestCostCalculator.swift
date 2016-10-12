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
    
    func calculateLowestCost(dataSet: [[Int]]) -> Bool? {
        self.dataSet = dataSet
        rowCount = dataSet.count
        columnCount = dataSet[0].count
        
        var lowestTotalCost = Int.max
        for rowIndex in 0 ..< rowCount {
            let lowestCostForRow = lowestCostAtPosition(cost: 0, column: columnCount - 1, row: rowIndex)
            print("lowest cost for row \(rowIndex) is \(lowestCostForRow)")
            lowestTotalCost = min(lowestTotalCost, lowestCostForRow)
        }
        return lowestTotalCost < abandonPathValue
    }
    
    func lowestCostAtPosition(cost: Int, column: Int, row: Int) -> Int {
        if column > 0 {
            let costAbove = cost + lowestCostAtPosition(cost: cost, column: column-1, row: row == 0 ? rowCount - 1 : row - 1) + dataSet[row][column]
            let costInRow = cost + lowestCostAtPosition(cost: cost, column: column-1, row: row) + dataSet[row][column]
            let costBelow = cost + lowestCostAtPosition(cost: cost, column: column-1, row: row == rowCount - 1 ? 0 : row + 1) + dataSet[row][column]
            print("column \(column) row \(row), costAbove = \(costAbove) costInRow = \(costInRow) costBelow = \(costBelow)")
            return min(costInRow, min(costAbove, costBelow))
        } else {
            let costAbove = dataSet[row == 0 ? rowCount - 1 : row - 1][0]
            let costInRow = dataSet[row][0]
            let costBelow = dataSet[row == rowCount - 1 ? 0 : row + 1][0]
            print("column 0, row \(row) costAbove = \(costAbove) costInRow = \(costInRow) costBelow = \(costBelow)")
            return min(costInRow, min(costAbove, costBelow))
        }
    }
    
}
