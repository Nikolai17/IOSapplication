//
//  TableView.swift
//  PenzaAutoTests
//
//  Created by gitlab on 09/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import XCTest
import UIKit

@testable import PenzaAuto

class TableView: XCTestCase {
    var mockTable: MockTable!

    override func setUp() {
        super.setUp()
       
    }

    override func tearDown() {
        super.tearDown()

    }
    
    func testTableViewCellForRowAtIndexPath() {
        mockTable = MockTable(testCase: self)
        
        XCTAssertNil(mockTable.tableView, "Before loading the table view should be nil")

        let _ = mockTable.view

        XCTAssertNotNil(mockTable.tableView, "The table view should be set")
      
    }
}

