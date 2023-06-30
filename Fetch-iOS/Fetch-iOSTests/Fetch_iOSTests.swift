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
        mealViewModel = MealViewModel()
    }
    
    override func tearDown() {
        mealViewModel = nil
        super.tearDown()
    }
    
    func testFetchMeals() {
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        mealViewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Assert that meals array is not empty after fetching
            XCTAssertFalse(self.mealViewModel.meals.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
}


class ContentViewTests: XCTestCase {
    
    func testMealViewModelFetch() {
        let viewModel = MealViewModel()
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        viewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(viewModel.meals.isEmpty)
            expectation.fulfill()
        }
        
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
