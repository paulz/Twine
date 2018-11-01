//
//  EmailClientUITests.swift
//  EmailClientUITests
//
//  Created by Paul Zabelin on 10/29/18.
//  Copyright © 2018 Paul Zabelin. All rights reserved.
//

import XCTest

class UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testSections() {
        let unreadSection = app.staticTexts["UNREAD EMAILS"]
        XCTAssert(unreadSection.exists, "there should be a section for unread emails")
        XCTAssert(app.staticTexts["READ EMAILS"].exists, "there should be a section for unread emails")
    }
}
