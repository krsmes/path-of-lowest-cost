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
    
    override func setUp() {
        super.setUp()
        setupFromStoryboard()
    }

    func testPassableResultLabelIsConnected() {
        XCTAssertNotNil(viewController!.passableResultLabel)
    }
    
    func testCostResultLabelIsConnected() {
        XCTAssertNotNil(viewController!.costResultLabel)
    }

    func testPathResultLabelIsConnected() {
        XCTAssertNotNil(viewController!.pathResultLabel)
    }

    func testDataSet1ButtonIsConnected() {
        XCTAssertNotNil(viewController!.dataSet1Button)
    }

    func testDataSet2ButtonIsConnected() {
        XCTAssertNotNil(viewController!.dataSet2Button)
    }

    func testDataSet3ButtonIsConnected() {
        XCTAssertNotNil(viewController!.dataSet3Button)
    }
    
    func setupFromStoryboard() {
        viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController!.loadView()
    }

}
