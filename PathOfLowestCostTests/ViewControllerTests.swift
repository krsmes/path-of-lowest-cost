//
//  ViewControllerTests.swift
//  PathOfLowestCost
//
//  Created by Apps Incorporated on 10/13/16.
//  Copyright © 2016 Apps Incorporated. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController?
    
    func testPassableResultLabelIsConnected() {
        setupFromStoryboard()
        XCTAssertNotNil(viewController!.passableResultLabel)
    }
    
    func testCostResultLabelIsConnected() {
        setupFromStoryboard()
        XCTAssertNotNil(viewController!.costResultLabel)
    }

    func testPathResultLabelIsConnected() {
        setupFromStoryboard()
        XCTAssertNotNil(viewController!.pathResultLabel)
    }

    func testDataSet1ButtonIsConnected() {
        setupFromStoryboard()
        XCTAssertNotNil(viewController!.dataSet1Button)
    }

    func testDataSet2ButtonIsConnected() {
        setupFromStoryboard()
        XCTAssertNotNil(viewController!.dataSet2Button)
    }

    func testDataSet3ButtonIsConnected() {
        setupFromStoryboard()
        XCTAssertNotNil(viewController!.dataSet3Button)
    }
    
    func setupFromStoryboard() {
        viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController!.loadView()
    }

}
