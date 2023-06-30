//
//  Fetch_iOSTests.swift
//  Fetch-iOSTests
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import XCTest
@testable import Fetch_iOS

class MealViewModelTests: XCTestCase {
    var mealViewModel: MealViewModel!
    
    override func setUp() {
        super.setUp()
        
        // Create an instance of MealViewModel for testing
        mealViewModel = MealViewModel()
    }
    
    override func tearDown() {
        // Clean up the mealViewModel instance after each test
        mealViewModel = nil
        super.tearDown()
    }
    
    func testFetchMeals() {
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        // Call the fetchMeals method to initiate the fetching process
        mealViewModel.fetchMeals()
        
        // Wait for a certain amount of time to allow the fetch to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Assert that the meals array is not empty after fetching
            XCTAssertFalse(self.mealViewModel.meals.isEmpty)
            
            // Fulfill the expectation to indicate that the test has completed successfully
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled within the given timeout period
        wait(for: [expectation], timeout: 3.0)
    }
}



class ContentViewTests: XCTestCase {
    
    func testMealViewModelFetch() {
        // Create an instance of MealViewModel for testing
        let viewModel = MealViewModel()
        
        // Create an expectation with a description for the test
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        // Call the fetchMeals method to initiate the fetching process
        viewModel.fetchMeals()
        
        // Wait for a certain amount of time to allow the fetch to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Assert that the meals array is not empty after fetching
            XCTAssertFalse(viewModel.meals.isEmpty)
            
            // Fulfill the expectation to indicate that the test has completed successfully
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled within the given timeout period
        wait(for: [expectation], timeout: 3)
    }
}



final class Fetch_iOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
