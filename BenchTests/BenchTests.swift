//
//  BenchTests.swift
//  BenchTests
//
//  Created by mahesh lad on 02/08/2025.
//

import XCTest
@testable import Bench

final class BenchTests: XCTestCase {
    
    var viewModel: WorkoutViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = WorkoutViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.sets.count, 3)
        XCTAssertEqual(viewModel.currentStep, .start)
        XCTAssertNil(viewModel.selectedSetIndex)
        XCTAssertEqual(viewModel.restDuration, 60)
        XCTAssertEqual(viewModel.countdownRemaining, 0)
    }
    
    func testStartWorkout() {
        viewModel.startWorkout()
        XCTAssertEqual(viewModel.currentStep, .timer)
    }
    
    func testCompleteSet() {
        viewModel.completeSet(at: 0)
        XCTAssertTrue(viewModel.sets[0].completed)
        XCTAssertEqual(viewModel.currentStep, .restPicker)
    }
    
    func testComplete() {
        let initialState = viewModel.shouldPresentSheet
        viewModel.complete()
        XCTAssertEqual(viewModel.shouldPresentSheet, !initialState)
    }
    
    func testSummaryText() {
        viewModel.sets[0].kg = "50"
        viewModel.sets[0].reps = "10"
        
        let summary = viewModel.summarytext()
        XCTAssertEqual(summary.count, viewModel.sets.count)
        XCTAssertEqual(summary[0].kg, "50")
        XCTAssertEqual(summary[0].reps, "10")
    }
    
    func testBeginCountdown() {
        viewModel.restDuration = 2
        viewModel.beginCountdown()
        
        XCTAssertEqual(viewModel.countdownRemaining, 2)
        XCTAssertEqual(viewModel.currentStep, .countdown)
        
        // Wait for countdown to complete
        let expectation = XCTestExpectation(description: "Countdown completion")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            XCTAssertEqual(self.viewModel.countdownRemaining, 0)
            XCTAssertEqual(self.viewModel.currentStep, .summary)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
}
