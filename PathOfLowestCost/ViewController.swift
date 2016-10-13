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
    }
    
    @IBAction func dataSet2Selected() {
   }
    
    @IBAction func dataSet3Selected() {
    }
    
}

