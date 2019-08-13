//
//  TableMock.swift
//  PenzaAutoTests
//
//  Created by gitlab on 09/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import XCTest
import Mockit
import Alamofire

@testable import PenzaAuto

class MockTable: ForumViewController, Mock {
    let callHandler: CallHandler
    
//    weak var tableView: UITableView!
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
        super.init(nibName: "ForumViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instanceType() -> MockTable {
        return self
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let _ = callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs: tableView, section)
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let _ = callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs:tableView, indexPath )
        return UITableViewCell()
    }

}
