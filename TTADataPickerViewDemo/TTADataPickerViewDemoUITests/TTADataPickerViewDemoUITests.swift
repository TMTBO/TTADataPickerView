//
//  TTADataPickerViewDemoUITests.swift
//  TTADataPickerViewDemoUITests
//
//  Created by TobyoTenma on 13/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import XCTest

class TTADataPickerViewDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUI() {
        
        let app = XCUIApplication()
        let textButton = app.buttons["Text"]
        textButton.tap()
        app.otherElements.containing(.staticText, identifier:"TTADataPickerView").children(matching: .other).element.tap()
        textButton.tap()
        
        let toolbarsQuery = app.toolbars
        let doneButton = toolbarsQuery.buttons["Done"]
        doneButton.tap()
        app.otherElements.containing(.staticText, identifier:"First First First").children(matching: .button).matching(identifier: "Date").element(boundBy: 0).tap()
        doneButton.tap()
        app.buttons["Time"].tap()
        toolbarsQuery.buttons["Cancel"].tap()
        app.otherElements.containing(.staticText, identifier:"Mar 13, 2017").children(matching: .button).matching(identifier: "Date").element(boundBy: 1).tap()
        doneButton.tap()
        
    }
    
}
