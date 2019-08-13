//
//  SecondScreen.swift
//  PenzaAutoUITests
//
//  Created by gitlab on 13/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import XCTest

class SecondScreen: XCTestCase {
    let app = XCUIApplication()
    
    
    override func setUp() {
        
        app.launch()
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let SecondController = storyboard.instantiateViewController(withIdentifier: "ForumViewController")
        UIApplication.shared.keyWindow!.rootViewController = SecondController
        let _ = SecondController.view
       
        
    }

    override func tearDown() {
        
    }

    func testAnotherScreen() {
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["- 4"]/*[[".cells.staticTexts[\"- 4\"]",".staticTexts[\"- 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["- 2"]/*[[".cells.staticTexts[\"- 2\"]",".staticTexts[\"- 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }

}

