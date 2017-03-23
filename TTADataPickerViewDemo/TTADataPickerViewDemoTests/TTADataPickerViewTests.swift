//
//  TTADataPickerViewTests.swift
//  TTADataPickerViewDemo
//
//  Created by TobyoTenma on 23/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import XCTest
@testable import TTADataPickerViewDemo

class TTADataPickerViewTests: XCTestCase {
    
    var picker: TTADataPickerView!
    
    override func setUp() {
        super.setUp()
        
        picker = TTADataPickerView()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testPickerType() {
        let types: [TTADataPickerViewType] = [.text, .date, .time, .dateTime]
        _ = types.map { setPickerType(type: $0) }
    }
    
    func setPickerType(type: TTADataPickerViewType) {
        picker.type = type
        XCTAssertEqual(picker.type, type)
    }
    
    func testSetCoponents() {
        picker.textItemsForComponent = [["hello", "world"]]
        picker.selectedTitles(["hello"])
    }
    
    func testShowPicker() {
        picker.show()
    }
    
    func testApperanceConfirmButtonAttributes() {
        // given
        let apperance = TTADataPickerView.appearance()
        let att = [NSForegroundColorAttributeName: UIColor.red]
        // when
        apperance.setConfirmButtonAttributes(att: att)
        // then
        if let attribute = picker.confirmButtonAttributes {
            XCTAssert(attribute[NSForegroundColorAttributeName] as? UIColor == att[NSForegroundColorAttributeName])
        }
    }
    
    func testApperanceCancelButtonAttributes() {
        // given
        let apperance = TTADataPickerView.appearance()
        let att = [NSForegroundColorAttributeName: UIColor.red]
        // when
        apperance.setCancelButtonAttributes(att: att)
        // then
        if let attribute = picker.cancelButtonAttributes {
            XCTAssert(attribute[NSForegroundColorAttributeName] as? UIColor == att[NSForegroundColorAttributeName])
        }
    }
    
    func testApperanceToolBarBarTintColor() {
//        // given
//        let apperance = TTADataPickerView.appearance()
//        let color = UIColor.red
//        // when
//        apperance.setToolBarTintColor(color: color)
//        // then
//        XCTAssertEqual(picker.toolBarTintColor, color)
    }
    
    func testApperanceTitleFont() {
//        // given
//        let apperance = TTADataPickerView.appearance()
//        let font = UIFont.systemFont(ofSize: 15)
//        // when
//        apperance.setTitleFont(font: font)
//        // then
//        XCTAssertEqual(picker.titleFont, font)
    }
    
    func testApperanceTitleColor() {
//        // given
//        let apperance = TTADataPickerView.appearance()
//        let color = UIColor.black
//        // when
//        apperance.setTitleColor(color: color)
//        // then
//        XCTAssertEqual(picker.titleColor, color)
    }
    
}
