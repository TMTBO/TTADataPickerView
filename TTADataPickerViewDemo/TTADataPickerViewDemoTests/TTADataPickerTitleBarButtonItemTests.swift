//
//  TTADataPickerTitleBarButtonItemTests.swift
//  TTADataPickerViewDemo
//
//  Created by TobyoTenma on 23/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import XCTest
@testable import TTADataPickerViewDemo

class TTADataPickerTitleBarButtonItemTests: XCTestCase {
    
    var buttonItem: TTADataPickerTitleBarButtonItem!
    
    override func setUp() {
        super.setUp()
        
        buttonItem = TTADataPickerTitleBarButtonItem(title: "Hello World")
    }
    
    override func tearDown() {
        buttonItem = nil
        super.tearDown()
    }
    
    func testSetFont() {
        let fonts = [UIFont.systemFont(ofSize: 15), nil]
        _ = fonts.map { setFont(font: $0) }
    }
    
    func setFont(font: UIFont?) {
        // given
        buttonItem.font = font
        // when
        
        // then
        XCTAssertEqual(buttonItem.font, font)
    }
    
    func testSetTitleColor() {
        let colors = [UIColor.red, nil]
        _ = colors.map { setTitleColor(color: $0) }
    }
    
    func setTitleColor(color: UIColor?) {
        // given
        buttonItem.titleColor = color
        
        // when
        
        // then
        XCTAssertEqual(buttonItem.titleColor, color)
    }
    
}
