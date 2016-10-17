//
//  ViewController.swift
//  PathOfLowestCost
//
//  Created by Apps Incorporated on 10/12/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passableResultLabel: UILabel!
    @IBOutlet weak var costResultLabel: UILabel!
    @IBOutlet weak var pathResultLabel: UILabel!
    
    @IBOutlet weak var dataSet1Button: UIButton!
    @IBOutlet weak var dataSet2Button: UIButton!
    @IBOutlet weak var dataSet3Button: UIButton!
    
    let calculator = PathOfLowestCostCalculator()
    let passableString = "Yes"
    let notPassableString = "No"
    
    @IBAction func dataSet1Selected() {
        let dataSet =
            [[3, 4, 1, 2, 8, 6],
             [6, 1, 8, 2, 7, 4],
             [5, 9, 3, 9, 9, 5],
             [8, 4, 1, 3, 2, 6],
             [3, 7, 2, 8, 6, 4]]
        calculateResultsForDataSet(dataSet: dataSet)
        dataSet1Button.isSelected = true
        dataSet2Button.isSelected = false
        dataSet3Button.isSelected = false
    }
    
    @IBAction func dataSet2Selected() {
        let dataSet =
            [[3, 4, 1, 2, 8, 6],
             [6, 1, 8, 2, 7, 4],
             [5, 9, 3, 9, 9, 5],
             [8, 4, 1, 3, 2, 6],
             [3, 7, 2, 1, 2, 3]]
        calculateResultsForDataSet(dataSet: dataSet)
        dataSet1Button.isSelected = false
        dataSet2Button.isSelected = true
        dataSet3Button.isSelected = false
    }
    
    @IBAction func dataSet3Selected() {
        let dataSet =
            [[19, 10, 19, 10, 19],
             [21, 23, 20, 19, 12],
             [20, 12, 20, 11, 10]]
        calculateResultsForDataSet(dataSet: dataSet)
        dataSet1Button.isSelected = false
        dataSet2Button.isSelected = false
        dataSet3Button.isSelected = true
    }
    
    func calculateResultsForDataSet(dataSet: [[Int]]) {
        let result = calculator.calculateLowestCost(dataSet: dataSet)
        
        passableResultLabel!.text = result.isPathPassable ? passableString : notPassableString
        costResultLabel!.text = "\(result.lowestCost)"
        setPathResultLabel(path: result.path)
    }
    
    func setPathResultLabel(path: [Int]) {
        var pathString = ""
        for pathValue in path {
            pathString += "\(pathValue)" + " "
        }
        pathResultLabel.text = pathString
    }    
}

