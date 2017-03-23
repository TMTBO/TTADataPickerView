//
//  TTADataPickerToolBarTests.swift
//  TTADataPickerViewDemo
//
//  Created by TobyoTenma on 23/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import XCTest

@testable import TTADataPickerViewDemo

class TTADataPickerToolBarTests: XCTestCase {
    
    var toolBar: TTADataPickerToolBar!
    
    override func setUp() {
        super.setUp()
        
        toolBar = TTADataPickerToolBar()
    }
    
    override func tearDown() {
        toolBar = nil
        super.tearDown()
    }
    
    func testToolBarLayoutSubviews() {
        // given 
        toolBar.layoutSubviews()
        // when
        
        // then
        XCTAssert(toolBar != nil)
    }
    
}
