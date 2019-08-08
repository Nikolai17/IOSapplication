//
//  MockFM.swift
//  PenzaAutoTests
//
//  Created by gitlab on 08/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import Foundation
import XCTest
import Mockit
import Alamofire

@testable import PenzaAuto

class MockFM: ForumModel, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockFM {
        return self
    }
    
   
    
}
