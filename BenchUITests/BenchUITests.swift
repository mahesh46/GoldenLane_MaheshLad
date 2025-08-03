//
//  BenchUITests.swift
//  BenchUITests
//
//  Created by mahesh lad on 02/08/2025.
//

import XCTest

final class BenchUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testWorkoutFlow() throws {
        // Start workout
        XCTAssertTrue(app.buttons["Start Workout"].exists)
        app.buttons["Start Workout"].tap()
        
        // Complete first set
        let setButton = app.buttons["Set 1"]
        XCTAssertTrue(setButton.exists)
        setButton.tap()
        
        // Input weight and reps
        let weightField = app.textFields["Weight"]
        let repsField = app.textFields["Reps"]
        
        XCTAssertTrue(weightField.exists)
        XCTAssertTrue(repsField.exists)
        
        weightField.tap()
        weightField.typeText("50")
        
        repsField.tap()
        repsField.typeText("10")
        
        app.buttons["Done"].tap()
        
        // Check rest timer
        let restTimer = app.staticTexts["Rest Timer"]
        XCTAssertTrue(restTimer.exists)
        
        // Wait for countdown
        let countdown = app.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] 'seconds'")).firstMatch
        XCTAssertTrue(countdown.waitForExistence(timeout: 2))
    }
    
    func testNavigationFlow() throws {
        // Test navigation between different views
        app.buttons["Start Workout"].tap()
        
        // Verify timer view
        XCTAssertTrue(app.staticTexts["Timer"].exists)
        
        // Complete workout
        app.buttons["Complete"].tap()
        
        // Verify summary view
        XCTAssertTrue(app.staticTexts["Workout Summary"].exists)
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
