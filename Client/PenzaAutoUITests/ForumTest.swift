//
//  ForumTest.swift
//  PenzaAutoUITests
//
//  Created by gitlab on 12/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import XCTest


extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
class ForumTest: XCTestCase {
    
    
    var app: XCUIApplication!

    override func setUp() {
        
        app = XCUIApplication()
        app.launch()
        app.launchArguments.append("--UITests")
    }

    override func tearDown() {
        
    }

    func testExample() {
        
        
        let app = XCUIApplication()
        app.textFields["Введите логин"].tap()
        app.textFields["Введите логин"].typeText("Volnikov")
        let secureTextField = app.secureTextFields["Введите пароль"]
        secureTextField.tap()
        app.secureTextFields["Введите пароль"].typeText("1234")
        
        app.buttons["Войти"].isSelected
        app.buttons["Войти"].tap()
        
        
        
        app.navigationBars["Volnikov"].buttons["Add"].tap()
        app.navigationBars["Создание темы"].buttons["Volnikov"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["- 4"]/*[[".cells.staticTexts[\"- 4\"]",".staticTexts[\"- 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["- 2"]/*[[".cells.staticTexts[\"- 2\"]",".staticTexts[\"- 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        

       
        
       
        
       
    
    }

}
