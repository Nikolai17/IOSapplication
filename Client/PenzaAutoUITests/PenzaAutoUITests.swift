//
//  PenzaAutoUITests.swift
//  PenzaAutoUITests
//
//  Created by gitlab on 16/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import XCTest

class PenzaAutoUITests: XCTestCase {
var app: XCUIApplication!
    override func setUp() {
        
        app = XCUIApplication()
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleSwitch() {        
        
        app.textFields["Login"]
        app.secureTextFields["Password"]
        app.buttons["Войти"]
        
        
        let login = app.textFields["Login"]
        let pass = app.textFields["Password"]
        let typeButton = app.buttons["Войти"]
        
        if typeButton.isSelected {
            XCTAssertTrue(login.exists)
            XCTAssertTrue(pass.exists)
        }
    }
  
}
