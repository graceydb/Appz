//
//  TelegramTests.swift
//  TelegramTests
//
//  Created by Mariam AlJamea on 12/28/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Appz

class TelegramTests: XCTestCase {
    
    let appCaller = ApplicationCallerMock()
    
    func testConfiguration() {
        
        let telegram = Applications.Telegram()
        XCTAssertEqual(telegram.scheme, "tg:")
        XCTAssertEqual(telegram.fallbackURL, "https://t.me/")
    }
    
    func testMsg() {
        
        let message = "Hi"
        let phone = "12345" //You must prefix the number with +
        let action = Applications.Telegram.Action.msg(message: message, phone: phone)
        
        XCTAssertEqual(action.paths.app.pathComponents, ["msg"])
        XCTAssertEqual(action.paths.app.queryParameters,
                                                        ["text": message,
                                                           "to": phone,])
        XCTAssertEqual(action.paths.web, Path())
    }
    
    func testOpenFromID() {
        
        let id = "kafiha" // Example channel
        let action = Applications.Telegram.Action.openFromID(username: id)
        
        XCTAssertEqual(action.paths.app.pathComponents, ["resolve"])
        XCTAssertEqual(action.paths.app.queryParameters, ["domain": id])
        XCTAssertEqual(action.paths.web.pathComponents, [id])
        XCTAssertEqual(action.paths.web.queryParameters, [:])
    }
}
