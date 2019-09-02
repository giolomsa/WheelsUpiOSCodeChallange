//
//  WheelsUpiOSUnitTests.swift
//  WheelsUpiOSUnitTests
//
//  Created by Gio Lomsa on 9/1/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import XCTest


class WheelsUpiOSUnitTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testMainUrlSessionForRootObjests(){
        
        let expectation = XCTestExpectation(description: "Get main items")
        let networking = HTTPLayer()
        
        networking.request(at: .root) { (data, response, error) in
            
            XCTAssertNotNil(data, "Main URLSession test failed")
            if let response = response as? HTTPURLResponse{
                XCTAssert(response.statusCode.isSuccessHTTPCode, "Main URLSession response status isn't success")
            }else{
                XCTAssert(false, "Main URLSession response failed")
            }
            XCTAssertNil(error, "Main URLSession error")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testMainUrlSessionForUrl(){
        
        let expectation = XCTestExpectation(description: "Get items from url")
        
        let urlString = "https://swapi.co/api/species/3/"
        let networking = HTTPLayer()
        networking.request(at: .fromUrl(urlString)) { (data, response, error) in
            
            XCTAssertNotNil(data, "Main URLSession test failed")
            
            if let response = response as? HTTPURLResponse{
                XCTAssert(response.statusCode.isSuccessHTTPCode, "Main URLSession response status isn't success")
            }else{
                XCTAssert(false, "Main URLSession response failed")
            }
            
            XCTAssertNil(error, "Main URLSession error")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRootObjectsLoading(){
        
        let expectation = XCTestExpectation(description: "load root objects")
        
        let httpLayer = HTTPLayer()
        let networking = APIClient(httpLayer: httpLayer)
        
        networking.getRootObjects { (result) in
            switch result{
            case .failure(_):
                XCTAssert(false, "Error while loading root Items")
            case .success(let itemsDictionary):
                XCTAssert(!itemsDictionary.isEmpty, "Loaded root Items dictionary is empty")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCategoryElementsLoading(){
        
        let expectation = XCTestExpectation(description: "load category elements")
        
        let httpLayer = HTTPLayer()
        let networking = APIClient(httpLayer: httpLayer)
        let urlString = "https://swapi.co/api/planets"
        
        networking.getCategoryElements(urlString: urlString) { (result) in
            switch result{
            case .failure(_):
                XCTAssert(false, "Error loading Category Elements")
            case .success(_):
                XCTAssert(true, "Error loading Category Elements")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testElementDetailsLoading(){
        
        let expectation = XCTestExpectation(description: "load element details")
        
        let httpLayer = HTTPLayer()
        let networking = APIClient(httpLayer: httpLayer)
        let urlString = "https://swapi.co/api/planets/1"
        
        networking.getElementDetails(urlString: urlString) { (result) in
            print(urlString)
            switch result{
            case .failure(_):
                XCTAssert(false, "Error loading Element details")
            case .success(_):
                XCTAssert(true, "Error loading Element details")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testStringFromUrlLoading(){
        
        let expectation = XCTestExpectation(description: "load string arrat from url array")
        
        let viewModel = ItemDetailsViewModel()
        let urlStringsArray = ["https://swapi.co/api/people/1/",
                               "https://swapi.co/api/people/2/",
                               "https://swapi.co/api/people/3/"
                               ]
        viewModel.loadStringFromUrl(urlArray: urlStringsArray) { (result) in
                XCTAssert(result.count > 0, "Error loading Element details")
            expectation.fulfill()
        }
    wait(for: [expectation], timeout: 10.0)
    }
}
