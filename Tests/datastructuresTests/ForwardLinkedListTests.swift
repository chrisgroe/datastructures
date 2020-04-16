//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Christian Gröling on 27.03.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import XCTest
@testable import datastructures

class ForwardLinkedListTests: XCTestCase {
    
    
    func testInitWithSequence() {
        let ll = ForwardLinkedList<Int>([1,2,3,4])
        XCTAssertEqual(Array<Int>(ll), [1,2,3,4])
    }
    
    func testInitWithRange() {
        let ll = ForwardLinkedList<Int>(1...4)
        XCTAssertEqual(Array<Int>(ll), [1,2,3,4])
    }
    
    func testInitWithRepeatingArgs() {
        let ll = ForwardLinkedList<Int>(repeating: 123, count: 4)
        XCTAssertEqual(Array<Int>(ll), [123,123,123,123])
    }
    
    // - MARK: First
    func testFirstWith0Elements() {
        let ll = ForwardLinkedList<String>()
        
        XCTAssertNil(ll.first)
    }
    
    func testFirstWith1Element() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        XCTAssertEqual(ll.first,123)
    }
    
    func testFirstWith2Elements() {
          let ll = ForwardLinkedList<Int>()
          ll.append(123)
          ll.append(321)
          XCTAssertEqual(ll.first,123)
      }
    
    // - MARK: Last
    func testLastWith0Elements() {
        let ll = ForwardLinkedList<String>()
        
        XCTAssertNil(ll.last)
    }

    func testLastWith1Element() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        XCTAssertEqual(ll.last,123)
    }
    
    func testLastWith2Elements() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        ll.append(321)
        XCTAssertEqual(ll.last,321)
    }
    
     // - MARK: Iterator
    
    func testIteratorWith0Elements() {
        let ll = ForwardLinkedList<String>()
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertNil(value0)
        
        let value1 = it.next()
        XCTAssertNil(value1)
    }

    
    func testIteratorWith2Elements() {
        let ll = ForwardLinkedList<String>()
        ll.append("a")
        ll.append("b")
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertEqual(value0,"a")
        
        let value1 = it.next()
        XCTAssertEqual(value1, "b")
        
        let value2 = it.next()
        XCTAssertNil(value2)
    }
    
    // -MARK: Count
    func testCountWith0Elements() {
        let ll = ForwardLinkedList<Int>()
        XCTAssertEqual(ll.count, 0)
    }
    
    func testCountWith3Elements() {
        let ll = ForwardLinkedList(1,2,3)
        XCTAssertEqual(ll.count, 3)
    }
    
    // -MARK: FirstIndexOf
    func testFirstIndexOfWith5ElementsAndResultInMid() {
        let ll = ForwardLinkedList<Int>(2,3,-3,1)
        XCTAssertEqual(ll.firstIndex(of: -3), 2)
    }
    
    // -MARK: Subscript
    func testSubscriptWith4ElementsOnlyRead_() {
        let ll = ForwardLinkedList(2,3,-3,1)
        XCTAssertEqual(ll[2], -3)
    }
    
    func testSubscriptWith4ElementsSetAndRead() {
        let ll = ForwardLinkedList(2,3,-3,1)
        ll[2] = 4
        XCTAssertEqual(ll[2], 4)
    }
    
    // -MARK: Insert
    func testInsertWithEmptyListAtPos0() {
        let ll = ForwardLinkedList<Int>()
        ll.insert(10, at: 0)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(ll[0], 10)
    }
    
    func testInsertWith1ElementAtPos0() {
        let ll = ForwardLinkedList<Int>(11)
        ll.insert(10, at: 0)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(ll[0], 10)
        XCTAssertEqual(ll[1], 11)
    }
    
    func testInsertWith3ElementsAtPos1() {
        let ll = ForwardLinkedList<Int>(11,13,14)
        ll.insert(12, at: 1)
        XCTAssertEqual(ll.count, 4)
        XCTAssertEqual(ll[0], 11)
        XCTAssertEqual(ll[1], 12)
        XCTAssertEqual(ll[2], 13)
        XCTAssertEqual(ll[3], 14)
    }
    
    func testInsertWith1ElementAtPos1() {
        let ll = ForwardLinkedList(10)
        ll.insert(11, at: 1)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(ll[0], 10)
        XCTAssertEqual(ll[1], 11)
    }
    
    // -MARK: Remove
    
    func testRemoveWith5ElementsAtPos0() {
        let ll = ForwardLinkedList<Int>(2,3,1,-2,-10)
        
        let removedElement = ll.remove(at:0)
        XCTAssertEqual(removedElement, 2)
        XCTAssertEqual(ll[0], 3)
        XCTAssertEqual(ll[1], 1)
        XCTAssertEqual(ll[2], -2)
        XCTAssertEqual(ll[3], -10)
        
    }
    
    func testRemoveWith5ElementsAtPos2() {
        let ll = ForwardLinkedList<Int>(2,3,1,-2,-10)
        let removedElement = ll.remove(at:2)
        XCTAssertEqual(removedElement, 1)
        XCTAssertEqual(ll[0], 2)
        XCTAssertEqual(ll[1], 3)
        XCTAssertEqual(ll[2], -2)
        XCTAssertEqual(ll[3], -10)
        
    }
    
    func testRemoveWith5ElementsAtEnd() {
        let ll = ForwardLinkedList<Int>(2,3,1,-2,-10)
        let removedElement = ll.remove(at:ll.endIndex-1)
        XCTAssertEqual(removedElement, -10)
        XCTAssertEqual(ll[0], 2)
        XCTAssertEqual(ll[1], 3)
        XCTAssertEqual(ll[2], 1)
        XCTAssertEqual(ll[3], -2)
    }
    
    
    // -MARK: Concat
    
    func testPlusWith2LinkedList() {
        let ll1 = ForwardLinkedList<Int>(1...5)
        let ll2 = ForwardLinkedList<Int>(6...10)
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
    
    func testPlusWithSequenceAndLinkedList() {
        let ll1 = [1,2,3,4,5]
        let ll2 = ForwardLinkedList<Int>(6...10)
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
    
    func testPlusWithLinkedListAndSequence() {
        let ll1 = ForwardLinkedList<Int>(1...5)
        let ll2 = [6,7,8,9,10]
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
    
    // MARK: Prepend
    func testPrependWithEmptyList() {
        let ll = ForwardLinkedList<Int>()
        ll.prepend(10)
        ll.prepend(20)
        ll.prepend(30)
        
        XCTAssertEqual(Array<Int>(ll), [30,20,10])
    }
    
    // MARK: CustomStringConvertible
    
    func testDescriptionWithEmptyList() {
        let ll = ForwardLinkedList<Int>()
        XCTAssertEqual(ll.description, "[]")
    }
    
    func testDescriptionWith1Element() {
        let ll = ForwardLinkedList<Int>([0])
        XCTAssertEqual(ll.description, "[0]")
    }
    func testDescriptionWith2Elements() {
        
        let ll = ForwardLinkedList<Int>([0,1])
        XCTAssertEqual(ll.description, "[0, 1]")
    }
    
    // MARK: RemoveFirst
    func testRemoveFirstWith3Elements() {
        let ll = ForwardLinkedList<Int>(1,2,3)
        
        XCTAssertEqual(ll.removeFirst(), 1)
        XCTAssertEqual(ll.removeFirst(), 2)
        XCTAssertEqual(ll.removeFirst(), 3)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func testRemoveFirstWith3ElementsAnd3Removals() {
        let ll = ForwardLinkedList<Int>([1,2,3])
        ll.removeFirst(3)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
        
    }
    
    // MARK: Tests RemoveLast
    func testRemoveLastWith3Elements() {
        let ll = ForwardLinkedList<Int>([1,2,3])
        
        XCTAssertEqual(ll.removeLast(), 3)
        XCTAssertEqual(ll.removeLast(), 2)
        XCTAssertEqual(ll.removeLast(), 1)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func testRemoveLastWith3ElementsAnd3Removals() {
        let ll = ForwardLinkedList<Int>([1,2,3])
        
        ll.removeLast(3)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    // MARK: Tests RemoveSubrange
    
    func testRemoveSubrangeWith3ElementsAtBegin()  {
        var ll = ForwardLinkedList(1,2,3)
        
        ll.removeSubrange(0...0)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [2,3])
    }
    
    func testRemoveSubrangeWith3ElementsAtMid() {
        var ll = ForwardLinkedList(1,2,3)
        
        ll.removeSubrange(1...1)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [1,3])
    }
    
    func testRemoveSubrangeWith3ElementsAtEnd() {
        var ll = ForwardLinkedList(1,2,3)
        
        ll.removeSubrange(2...2)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [1,2])
    }
    
    func testRemoveSubrangeWith3ElementsAtMid2Elements() {
        var ll = ForwardLinkedList<Int>([1,2,3])
        
        ll.removeSubrange(1...2)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [1])
    }
    
    func testRemoveSubrangeWith3ElementsWholeList() {
        var ll = ForwardLinkedList<Int>([1,2,3])
        
        ll.removeSubrange(0...2)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func testRemoveSubrangeWith3ElementsAtBegin2Elements() {
        var ll = ForwardLinkedList<Int>([1,2,3])
        
        ll.removeSubrange(0...1)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [3])
    }
    
    func testRemoveSubrangeWith4ElementsAtMid2Elements() {
        var ll = ForwardLinkedList(1,2,3,4)
        
        ll.removeSubrange(1...2)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [1,4])
    }
    
    func testRemoveSubrangeWith1ElementAll() {
        var ll = ForwardLinkedList<Int>([1])
        
        ll.removeSubrange(0...0)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func testRemoveSubrangeWith2ElementAll() {
        var ll = ForwardLinkedList(1, 2)
        
        ll.removeSubrange(0...1)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    // MARK: Reverse
    
    func testReverseWithEmptyList() {
        let ll = ForwardLinkedList<Int>()
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func testReverseWith1Element() {
        let ll = ForwardLinkedList(123)
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [123])
    }
    
    func testReverseWith2Elements() {
        let ll = ForwardLinkedList(123,321)
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [321, 123])
    }
    
    
    func testReverseWith6Elements() {
        let ll = ForwardLinkedList(1, 1, 2, 3, 5, 8)
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 6)
        XCTAssertEqual(Array<Int>(ll), [8, 5, 3, 2, 1, 1])
    }
    
    // MARK: Equatable
    func testEqualWith2IdenticalLists() {
        let ll1 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        let ll2 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        XCTAssertTrue(ll1 == ll2)
    }
    
    func testEqualWith2DifferingLists() {
        let ll1 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        let ll2 = ForwardLinkedList<Int>(1,2,3,4,6,5)
        XCTAssertFalse(ll1 == ll2)
    }
    
    func testEqualWithDifferingLength() {
        let ll1 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        let ll2 = ForwardLinkedList<Int>(1,2,3,4,5)
        XCTAssertFalse(ll1 == ll2)
    }

    
}
