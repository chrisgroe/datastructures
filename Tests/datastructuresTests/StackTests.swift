//
//  StackTests.swift
//  mapsterTests
//
//  Created by Christian Gröling on 10.04.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation
import XCTest
@testable import datastructures

class StackTests: XCTestCase {
    
    final class MockStackContainer : StackContainer {
        typealias Element = Int
        
        init() {
        }
        
        func prepend(_ element: Int) {
            prependList.append(element)
        }
        
        func removeFirst() -> Int {
            return removeFirstList.removeFirst()
        }
        
        var prependList : [Int] = []
        var removeFirstList : [Int] = []
        
        
        var first: Int? {
            guard removeFirstList.count != 0 else {
                return nil
            }
            return removeFirstList[0]
        }
        
        var count: Int = 0
        
        var isEmpty: Bool = true
        
       
    }
    
    func test_init_with3VariadicParameters_shouldFrontCorrectElementAndCount3() {
        let mock = MockStackContainer()
        mock.removeFirstList = [12]
        mock.count = 3
        mock.isEmpty = false
        
        let stack = StackGeneric(container: mock, 10,11,12)
        

        XCTAssertEqual(stack.front, 12)
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(mock.prependList, [10,11,12])
    }
    
    func test_push_with1Call_shouldFrontCorrectElementAndCount1() {
        
        let mock = MockStackContainer()
        mock.removeFirstList = [10]
        mock.count = 1
        mock.isEmpty = false
        
        let stack = StackGeneric(container: mock)
        stack.push(10)
        
        XCTAssertEqual(stack.front, 10)
        XCTAssertEqual(stack.count, 1)
        XCTAssertEqual(mock.prependList, [10])
    }
    
    func test_push_with2Calls_shouldFrontCorrectElementAndCount2() {
        
        let mock = MockStackContainer()
        mock.removeFirstList = [11]
        mock.count = 2
        mock.isEmpty = false
        
        let stack = StackGeneric(container: mock)
        stack.push(10)
        stack.push(11)
        
        XCTAssertEqual(stack.front, 11)
        XCTAssertEqual(stack.count, 2)
        XCTAssertEqual(mock.prependList, [10,11])
    }
    


    
    
    func test_pop_with3ElementsAnd4Calls_shouldReturnElementsInCorrectOrderAndNilAfterThat() {
        let mock = MockStackContainer()
        mock.removeFirstList = [10,11,12]
        mock.count = 3
        mock.isEmpty = false
        
        let stack = StackGeneric(container: mock, 10,11,12)
        
        XCTAssertEqual(stack.pop(), 10)
        XCTAssertEqual(stack.pop(), 11)
        XCTAssertEqual(stack.pop(), 12)
        XCTAssertEqual(mock.prependList, [10,11,12])
    }
    
    func test_pop_with0Elements_shouldReturnNil() {
        let mock = MockStackContainer()
        mock.removeFirstList = []
        mock.count = 0
        mock.isEmpty = true
        
        let stack = StackGeneric(container: mock)
        
        XCTAssertNil(stack.pop())
    }
    
}
