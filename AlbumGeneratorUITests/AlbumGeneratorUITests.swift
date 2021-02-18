//
//  AlbumGeneratorUITests.swift
//  AlbumGeneratorUITests
//
//  Created by Chris Eccleston on 2/18/21.
//

import XCTest

class AlbumGeneratorUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = ["uiTestMode"]
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadImage() throws {
        let albumimageImage = XCUIApplication().images["albumImage"]
        let screenshotBefore = albumimageImage.screenshot()
        albumimageImage.tap()
        let screenshotAfter = albumimageImage.screenshot()
        XCTAssertNotEqual(screenshotBefore.pngRepresentation, screenshotAfter.pngRepresentation)
    }
}
