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
    
    func calculateLowestCost(dataSet: [[Int]]) -> (isPathPassable: Bool, lowestCost: Int) {
        self.dataSet = dataSet
        rowCount = dataSet.count
        columnCount = dataSet[0].count
        
        var lowestTotalCost = Int.max
        var lowestCostAbandoned = false
        for rowIndex in 0 ..< rowCount {
            let lowestCostResult = lowestCostAtPosition(column: columnCount - 1, row: rowIndex)
            if lowestCostResult.lowestCost < lowestTotalCost {
                lowestTotalCost = lowestCostResult.lowestCost
                lowestCostAbandoned = lowestCostResult.abandoned
            }
        }
        return (isPathPassable: !lowestCostAbandoned, lowestCost: lowestTotalCost)
    }
    
    func lowestCostAtPosition(column: Int, row: Int) -> (lowestCost: Int, abandoned: Bool) {
        let rowAbove = row == 0 ? rowCount - 1 : row - 1
        let rowBelow = row == rowCount - 1 ? 0 : row + 1
        
        if column > 0 {
            let resultForRowAbove = lowestCostAtPosition(column: column-1, row: rowAbove)
            let costAbove = resultForRowAbove.lowestCost
            
            let resultForRow = lowestCostAtPosition(column: column-1, row: row)
            let costInRow = resultForRow.lowestCost
            
            let resultForRowBelow = lowestCostAtPosition(column: column-1, row: rowBelow)
            let costBelow = resultForRowBelow.lowestCost
            
            let valueForRowColumn = dataSet[row][column]
            
            if costAbove < costInRow && costAbove < costBelow {
                return shouldAbandon(cost: costAbove, valueForRowColumn: valueForRowColumn, previouslyAbandoned: resultForRowAbove.abandoned)
            } else if costInRow < costBelow  {
                return shouldAbandon(cost: costInRow, valueForRowColumn: valueForRowColumn, previouslyAbandoned: resultForRow.abandoned)
            } else {
                return shouldAbandon(cost: costBelow, valueForRowColumn: valueForRowColumn, previouslyAbandoned: resultForRowBelow.abandoned)
            }
        } else {
            return lowestCostInFirstColumn(row: row)
        }
    }
    
    func shouldAbandon(cost: Int, valueForRowColumn: Int, previouslyAbandoned: Bool) -> (lowestCost: Int, abandoned: Bool) {
        if (cost + valueForRowColumn > abandonPathValue || previouslyAbandoned) {
            return (lowestCost: cost, abandoned: true)
        }
        return (lowestCost: cost + valueForRowColumn, abandoned: false)
    }
    
    func lowestCostInFirstColumn(row: Int) -> (lowestCost: Int, abandoned: Bool) {
        let rowAbove = row == 0 ? rowCount - 1 : row - 1
        let rowBelow = row == rowCount - 1 ? 0 : row + 1

        let costAbove = dataSet[rowAbove][0]
        let costInRow = dataSet[row][0]
        let costBelow = dataSet[rowBelow][0]
        
        if costAbove < costInRow && costAbove < costBelow {
            return (lowestCost: costAbove, abandoned: costAbove > abandonPathValue)
        } else if costInRow < costBelow {
            return (lowestCost: costInRow, abandoned: costInRow > abandonPathValue)
        } else {
            return (lowestCost: costBelow, abandoned: costBelow > abandonPathValue)
        }

    }
    
}
