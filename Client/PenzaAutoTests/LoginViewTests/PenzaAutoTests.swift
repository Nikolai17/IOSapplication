//
//  PenzaAutoTests.swift
//  PenzaAutoTests
//
//  Created by gitlab on 16/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import XCTest
import Mockit
import Alamofire


@testable import PenzaAuto

open class CustomMatcher: TypeMatcher {
    open func match(argument arg: Any, withArgument withArg: Any) -> Bool {
        switch (arg, withArg) {
        case ( _ as [Any], _ as [Any]):
            return true
        case ( _ as (([String : String]?) -> Void), _ as (([String : String]?) -> Void)):
            return true

        default:
            return false
        }
    }
}


class PenzaAutoTests: XCTestCase {
    var mockModel: MockModel!
    var customMatcher: CustomMatcher!
    var mockMatcher: MockMatcher!
    var mockView: MockView!
    

    override func setUp() {
        super.setUp()
        customMatcher = CustomMatcher()
        mockMatcher = MockMatcher.sharedInstance
        mockMatcher.register(CustomMatcher.self, typeMatcher: customMatcher)
        mockModel = MockModel(testCase: self)
        mockView = MockView(testCase: self)
    }

    override func tearDown() {
 
    }

    func testPresenterModel() {
        let presenter = LoginPresenter(view: mockView, model: mockModel)
        let completion = presenter.completionBlock
        mockModel.when().call(withReturnValue: mockModel.modelKeyPressed(completion: completion, login: "String", pass: "String")).thenDo {
            (res: [Any?]) -> Void in
            completion(["Volnikov": "True"])
        }
        presenter.loginButtonPressed()
        mockView.verify(verificationMode: Once()).goToNextScreen("Volnikov", userType: .admin)
    }

    func testPodcaster() {       
        let vc = ViewController.init(nibName: Consts.nibNameFirstScreen, bundle: nil)
        let _ = vc.view
        XCTAssertEqual("Podcaster", vc.outPutLabel.text)
    }
    

    
}

