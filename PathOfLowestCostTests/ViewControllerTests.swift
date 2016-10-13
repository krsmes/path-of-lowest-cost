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
    
    func testDataSet1SelectedSetsPassableResultLabel() {
        viewController!.dataSet1Selected()
        XCTAssertEqual(viewController!.passableResultLabel!.text!, viewController!.passableString)
    }
    
    func testDataSet2SelectedSetsPassableResultLabel() {
        viewController!.dataSet2Selected()
        XCTAssertEqual(viewController!.passableResultLabel!.text!, viewController!.passableString)
    }
    
    func testDataSet3SelectedSetsPassableResultLabel() {
        viewController!.dataSet3Selected()
        XCTAssertEqual(viewController!.passableResultLabel!.text!, viewController!.notPassableString)
    }

    func testDataSet1SelectedSetsCostResultLabel() {
        viewController!.dataSet1Selected()
        XCTAssertEqual(viewController!.costResultLabel!.text!, "16")
    }
    
    func testDataSet2SelectedSetsCostResultLabel() {
        viewController!.dataSet2Selected()
        XCTAssertEqual(viewController!.costResultLabel!.text!, "11")
    }
    
    func testDataSet3SelectedSetsCostResultLabel() {
        viewController!.dataSet3Selected()
        XCTAssertEqual(viewController!.costResultLabel!.text!, "48")
    }
    
    func testDataSet1SelectedSetsPathResultLabel() {
        viewController!.dataSet1Selected()
        XCTAssertEqual(viewController!.pathResultLabel!.text!, "1 2 3 4 4 5 ")
    }
    
    func testDataSet2SelectedSetsPathResultLabel() {
        viewController!.dataSet2Selected()
        XCTAssertEqual(viewController!.pathResultLabel!.text!, "1 2 1 5 5 5 ")
    }
    
    func testDataSet3SelectedSetsPathResultLabel() {
        viewController!.dataSet3Selected()
        XCTAssertEqual(viewController!.pathResultLabel!.text!, "1 1 1 ")
    }
    
    func setupFromStoryboard() {
        viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController!.loadView()
    }

}
