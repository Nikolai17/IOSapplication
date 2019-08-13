//
//  MockModel.swift
//  PenzaAutoTests
//
//  Created by gitlab on 07/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import XCTest
import Mockit
import Alamofire

@testable import PenzaAuto

class MockModel: LoginModel, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockModel {
        return self
    }
    
    override  func modelKeyPressed(completion: @escaping([String : String]?) -> Void, login: String, pass: String) {
        let _ = callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs: completion, login, pass)
    }
    
}
