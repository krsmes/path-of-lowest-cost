//
//  Result.swift
//  PathOfLowestCost
//
//  Created by Sheila Wallace on 10/17/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import Foundation

class PathOfLowestCostResult {
    
    var isPathPassable: Bool = false
    var lowestCost: Int = 0
    var path: [Int] = []
    
    init (isPathPassable: Bool, lowestCost: Int, path: [Int]) {
        self.isPathPassable = isPathPassable
        self.lowestCost = lowestCost
        self.path = path
    }

}
