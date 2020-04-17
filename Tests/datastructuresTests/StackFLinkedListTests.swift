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

class StackFLinkedListTests: XCTestCase {

    
    func testStackFrontWith3Elements() {

        let stack = StackForwardLinkedList<Int>(10,11,12)
    
        XCTAssertEqual(stack.front, 12)
        XCTAssertEqual(stack.count, 3)
    }
    
    func unwindStackAndTest(_ stack: StackForwardLinkedList<Int>, _ expected: [Int]) {
        var actual = [Int]()
        var count = [Int]()
        for i in stack {
            actual.append(i)
            count.append(stack.count)
        }
        
        XCTAssertEqual(expected, actual)
        
        let expectedCount = Array((0..<100).reversed())
        XCTAssertEqual(count, expectedCount)
    }
    
    func testBasic() {
        let stack = StackForwardLinkedList<Int>()
        
        let pushed = Array(0..<100)
        for i in pushed
        {
            stack.push(i)
        }

        unwindStackAndTest(stack, pushed.reversed())
    }
    
    func testInitWithSequence() {
        let pushed = Array(0..<100)
        let stack = StackForwardLinkedList<Int>(pushed)

        unwindStackAndTest(stack, pushed.reversed())
    }
    
    
}
