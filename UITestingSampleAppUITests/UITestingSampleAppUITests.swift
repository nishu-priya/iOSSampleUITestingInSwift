//
//  UITestingSampleAppUITests.swift
//  UITestingSampleAppUITests
//
//  Created by Nishu Priya on 16/12/16.
//  Copyright © 2016 Nishu Priya. All rights reserved.
//

import XCTest

class UITestingSampleAppUITests: XCTestCase {
    
    let TIMEOUT = NSTimeInterval(60)
        
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

    func testRecording() {
        
        let app = XCUIApplication()
        let username1TextField = app.textFields["username1"]
        username1TextField.tap()
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        username1TextField.tap()
        passwordSecureTextField.tap()
        username1TextField.tap()
        username1TextField.typeText("username")
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        username1TextField.tap()
        username1TextField.tap()
        passwordSecureTextField.tap()
        username1TextField.tap()
        passwordSecureTextField.tap()
        app.buttons["login_button"].tap()
        app.staticTexts["Main Screen"].tap()
        
        
    }
    
    func testEmptyPasswordUsingUIRecording() {
        
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("a")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        app.buttons["login_button"].tap()
        
        let alert = app.alerts.staticTexts["Empty password"]
        let predicate = NSPredicate(format: "exists == true")
        expectationForPredicate(predicate, evaluatedWithObject: alert, handler: nil)
        waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }
    
    func testEmptyUsername() {
        
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        app.buttons["Log in"].tap()
        
        let alert = app.alerts.staticTexts["Empty username"]
        let predicate = NSPredicate(format: "exists = true")
        expectationForPredicate(predicate, evaluatedWithObject: alert, handler: nil)
        waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
        XCTAssertTrue(alert.exists)
    }
    
    func testEmptyPassword() {
        
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("username")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        app.buttons["Log in"].tap()
        
        let alert = app.alerts.staticTexts["Empty password"]
        let predicate = NSPredicate(format: "exists = true")
        expectationForPredicate(predicate, evaluatedWithObject: alert, handler: nil)
        waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }

    
    func testUsernameAndPasswordNotMached() {
        
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("username")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("a")
        app.buttons["Log in"].tap()
        
        let alert = app.alerts.staticTexts["Not matched"]
        let predicate = NSPredicate(format: "exists = true")
        expectationForPredicate(predicate, evaluatedWithObject: alert, handler: nil)
        waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }
    
    func testUsernameAndPasswordMatched() {
        
        let app = XCUIApplication()
        let usernameTextField = app.descendantsMatchingType(.TextField).matchingIdentifier("username").element
        usernameTextField.tap()
        usernameTextField.typeText("username")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        app.buttons["Log in"].tap()
        
        
        let label = app.staticTexts["Main Screen"]
        let predicate = NSPredicate(format: "exists = true")
        expectationForPredicate(predicate, evaluatedWithObject: label, handler: nil)
        waitForExpectationsWithTimeout(TIMEOUT, handler: nil)
    }
}

//extension XCTestCase {
//    
//    func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
//        let keyboard = XCUIApplication().keyboards.element
//        while (true) {
//            element.tap()
//            if keyboard.exists {
//                break;
//            }
//            NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 0.5))
//        }
//    }
//}
