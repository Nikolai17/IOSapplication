//
//  MockView.swift
//  PenzaAutoTests
//
//  Created by gitlab on 08/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//
import Foundation
import XCTest
import Mockit
import Alamofire

@testable import PenzaAuto

class MockView: ViewController, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instanceType() -> MockView {
        return self
    }

    override func goToNextScreen(_ temp: String, userType: UserType) {
        let _ = callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs: temp, userType)
    }
    
    override func changeLabel(msg: String?) {
       let _ = callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs: msg)
    }
    
   
}
