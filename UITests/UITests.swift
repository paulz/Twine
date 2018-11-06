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

    func launchOnce() {
        if app.state != .runningForeground {
            app.launch()
        }
    }

    override func setUp() {
        continueAfterFailure = false
        launchOnce()
    }

    func testSections() {
        let unreadSection = app.staticTexts["UNREAD EMAILS"]
        XCTAssert(unreadSection.exists, "there should be a section for unread emails")
        XCTAssert(app.staticTexts["READ EMAILS"].exists, "there should be a section for unread emails")
    }

    func testReadEmailSubjectBodyAndDate() {
        let firstReadEmailSubject = app.staticTexts["Next steps"]
        XCTAssert(firstReadEmailSubject.exists, "should read email with subject Next steps")
        XCTAssert(app.staticTexts["Ornare integer tincidunt quis ut nam, lobortis dignissim, montes eros"].exists)
        XCTAssert(app.staticTexts["Aug 1, 2017"].exists)
    }

    func testMarkAsReadShouldReduceUnreadCount() {
        let unreadCountBefore = app.buttons["Unread count: 3"]
        XCTAssert(unreadCountBefore.exists, "should show 3 unread emails")

        let markButton = app.buttons["Mark as Read"]
        XCTAssert(markButton.exists)
        markButton.firstMatch.tap()

        let unreadCountAfter = app.buttons["Unread count: 2"]
        XCTAssert(unreadCountAfter.exists, "should show 2 unread emails")
    }
}
