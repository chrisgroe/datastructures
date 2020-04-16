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

    
    func test_Init_withSequence_shouldContainCorrectElements() {
        let ll = ForwardLinkedList<Int>([1,2,3,4])
        XCTAssertEqual(Array<Int>(ll), [1,2,3,4])
    }
    
    func test_Init_withRange_shouldContainIntElements() {
        let ll = ForwardLinkedList<Int>(1...4)
        XCTAssertEqual(Array<Int>(ll), [1,2,3,4])
    }
    
    func test_Init_withRepeating_shouldContainRepeatingElements() {
           let ll = ForwardLinkedList<Int>(repeating: 123, count: 4)
           XCTAssertEqual(Array<Int>(ll), [123,123,123,123])
       }

    func test_first_with0Elements_shouldBeNil() {
        let ll = ForwardLinkedList<String>()

        XCTAssertNil(ll.first)
    }
    
    func test_last_with0Elements_shouldBeNil() {
        let ll = ForwardLinkedList<String>()
        
        XCTAssertNil(ll.last)
    }
    
    func test_first_with1Element_shouldBeContainingElement() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        XCTAssertEqual(ll.first,123)
    }
    
    func test_last_with1Element_shouldBeContainingElement() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        XCTAssertEqual(ll.last,123)
    }
    
    func test_first_with2Elements_shouldBeFirstElement() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        ll.append(321)
        XCTAssertEqual(ll.first,123)
    }
    
    func test_last_with2Elements_shouldBeLastElement() {
        let ll = ForwardLinkedList<Int>()
        ll.append(123)
        ll.append(321)
        XCTAssertEqual(ll.last,321)
    }
    
    
    func test_makeIterator_with0Elements_shouldIteratorNextReturnNil() {
        let ll = ForwardLinkedList<String>()
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertNil(value0)
        
        let value1 = it.next()
        XCTAssertNil(value1)
    }

    func test_makeIterator_with1Elements_shouldIteratorNextReturn1Element() {
        let ll = ForwardLinkedList<String>()
        ll.append("a")
        let it = ll.makeIterator()
        
        let value0 = it.next()
        XCTAssertEqual(value0, "a")
        
        let value1 = it.next()
        XCTAssertNil(value1)
    }
    
    func test_makeIterator_with2Elements_shouldIteratorNextReturn2Elements() {
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
    
    func test_count_with0Elements_shouldReturn0() {
        let ll = ForwardLinkedList<Int>()
        XCTAssertEqual(ll.count, 0)
    }
    
    func test_count_with3Elements_shouldReturn3() {
        let ll = ForwardLinkedList(1,2,3)
        XCTAssertEqual(ll.count, 3)
    }
    
    func test_firstIndexOf_withResultAtPos2_shouldReturn2() {
        let ll = ForwardLinkedList<Int>(2,3,-3,1)
        XCTAssertEqual(ll.firstIndex(of: -3), 2)
    }
    
    func test_distance_with4ElementsInLinkedListFrom0To2_shouldReturn2() {
        let ll = ForwardLinkedList(2,3,-3,1)
        XCTAssertEqual(ll.distance(from: 0, to: 2), 2)
    }
    
    func test_subscript_with4ElementsOnlyRead_shouldReturnCorrectElement() {
        let ll = ForwardLinkedList(2,3,-3,1)
        XCTAssertEqual(ll[2], -3)
    }
    
    func test_subscript_with4ElementsSetAndRead_shouldReturnCorrectElement() {
        let ll = ForwardLinkedList(2,3,-3,1)
        ll[2] = 4
        XCTAssertEqual(ll[2], 4)
    }
    
    func test_sorted_with5Elements_shouldReturnSortedCorrectly() {
        let ll = ForwardLinkedList<Int>(2,3,1, -2,-10)
        let sortedArray = ll.sorted()
        XCTAssertEqual(sortedArray, [-10,-2,1,2,3])
        
    }
    
    func test_insert_withEmptyLinkedListAtPos0_should1ElementInListAndCorrectContent() {
        let ll = ForwardLinkedList<Int>()
        ll.insert(10, at: 0)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(ll[0], 10)
    }
    
    func test_insert_with1ElementInListAtPos0_should2ElementInListAndCorrectContent() {
        let ll = ForwardLinkedList<Int>(11)
        ll.insert(10, at: 0)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(ll[0], 10)
        XCTAssertEqual(ll[1], 11)
    }
    
    func test_insert_with3ElementInListAtPos1_should4ElementInListAndCorrectContent() {
        let ll = ForwardLinkedList<Int>(11,13,14)
        ll.insert(12, at: 1)
        XCTAssertEqual(ll.count, 4)
        XCTAssertEqual(ll[0], 11)
        XCTAssertEqual(ll[1], 12)
        XCTAssertEqual(ll[2], 13)
        XCTAssertEqual(ll[3], 14)
    }
    
    func test_insert_with1ElementInListAtEnd_should2ElementInListAndCorrectContent() {
        let ll = ForwardLinkedList(10)
        ll.insert(11, at: 1)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(ll[0], 10)
        XCTAssertEqual(ll[1], 11)
    }
    
    func test_remove_with5ElementsInListAtPos0_should4ElementsInListAndElementWasRemovedCorrectly() {
        let ll = ForwardLinkedList<Int>(2,3,1,-2,-10)
        
        let removedElement = ll.remove(at:0)
        XCTAssertEqual(removedElement, 2)
        XCTAssertEqual(ll[0], 3)
        XCTAssertEqual(ll[1], 1)
        XCTAssertEqual(ll[2], -2)
        XCTAssertEqual(ll[3], -10)
        
    }
    
    func test_remove_with5ElementsInListAtPos2_should4ElementsInListAndElementWasRemovedCorrectly() {
        let ll = ForwardLinkedList<Int>(2,3,1,-2,-10)
        let removedElement = ll.remove(at:2)
        XCTAssertEqual(removedElement, 1)
        XCTAssertEqual(ll[0], 2)
        XCTAssertEqual(ll[1], 3)
        XCTAssertEqual(ll[2], -2)
        XCTAssertEqual(ll[3], -10)
        
    }
    
    func test_remove_with5ElementsInListAtEnd_should4ElementsInListAndElementWasRemovedCorrectly() {
        let ll = ForwardLinkedList<Int>(2,3,1,-2,-10)
        let removedElement = ll.remove(at:ll.endIndex-1)
        XCTAssertEqual(removedElement, -10)
        XCTAssertEqual(ll[0], 2)
        XCTAssertEqual(ll[1], 3)
        XCTAssertEqual(ll[2], 1)
        XCTAssertEqual(ll[3], -2)
    }
    
    func test_plus_with2LinkedList_shouldReturnLinkedList() {
        let ll1 = ForwardLinkedList<Int>(1...5)
        let ll2 = ForwardLinkedList<Int>(6...10)
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
    
    func test_plus_withSequenceAndLinkedList_shouldReturnLinkedList() {
        let ll1 = [1,2,3,4,5]
        let ll2 = ForwardLinkedList<Int>(6...10)
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }
       
    func test_plus_withLinkedListAndSequence_shouldReturnLinkedList() {
        let ll1 = ForwardLinkedList<Int>(1...5)
        let ll2 = [6,7,8,9,10]
        
        let ll = ll1 + ll2
        
        XCTAssertEqual(ll.count,10)
        XCTAssertEqual(Array<Int>(ll), Array<Int>(1...10))
    }

    
    func test_prepend_withEmptyListAnd3TimesPrepend_shouldContain3ElementsInCorrectOrder() {
         let ll = ForwardLinkedList<Int>()
         ll.prepend(10)
         ll.prepend(20)
         ll.prepend(30)

         XCTAssertEqual(Array<Int>(ll), [30,20,10])
     }

    // MARK: Tests CustomStringConvertible
    
    func test_description_withEmptyList_shouldReturnEmptyBrackets() {
        let ll = ForwardLinkedList<Int>()
        XCTAssertEqual(ll.description, "[]")
    }
    
    func test_description_with1ElementInList_shouldReturnBracketsContainingElement() {
        let ll = ForwardLinkedList<Int>([0])
        XCTAssertEqual(ll.description, "[0]")
    }
    func test_description_with2ElementInList_shouldReturnBracketsContainingElement() {

        let ll = ForwardLinkedList<Int>([0,1])
        XCTAssertEqual(ll.description, "[0, 1]")
    }
    
    // MARK: Tests RemoveFirst
    func test_removeFirst_with3ElementsInListAnd3DistinctRemovals_shouldListEmpty() {
        let ll = ForwardLinkedList<Int>(1,2,3)

        XCTAssertEqual(ll.removeFirst(), 1)
        XCTAssertEqual(ll.removeFirst(), 2)
        XCTAssertEqual(ll.removeFirst(), 3)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func test_removeFirst_with3ElementsInListAnd3Removals_shouldListEmpty() {
        let ll = ForwardLinkedList<Int>([1,2,3])
        ll.removeFirst(3)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])

    }
    
    // MARK: Tests RemoveLast
    func test_removeLast_with3ElementsInListAnd3DistinctRemovals_shouldListEmpty() {
        let ll = ForwardLinkedList<Int>([1,2,3])

        XCTAssertEqual(ll.removeLast(), 3)
        XCTAssertEqual(ll.removeLast(), 2)
        XCTAssertEqual(ll.removeLast(), 1)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func test_removeLast_with3ElementsInListAnd3Removals_shouldListEmpty() {
        let ll = ForwardLinkedList<Int>([1,2,3])

        ll.removeLast(3)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func test_removeLast_with3ElementsInListAnd2Removals_shouldListWith1Element() {
        let ll = ForwardLinkedList(1,2,3)

        ll.removeLast(2)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [1])
    }
    
    
    // MARK: Tests RemoveSubrange

    func test_removeSubrange_with3ElementsInListAndRemoveSingleElementAtBegin_shouldListWith2ElementsWithCorrectContent()  {
        var ll = ForwardLinkedList(1,2,3)

        ll.removeSubrange(0...0)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [2,3])
    }
    
    func test_removeSubrange_with3ElementsInListAndRemoveSingleElementAtMid_shouldListWith2ElementsWithCorrectContent() {
        var ll = ForwardLinkedList(1,2,3)

        ll.removeSubrange(1...1)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [1,3])
    }
    
    func test_removeSubrange_with3ElementsInListAndRemoveSingleElementAtEnd_shouldListWith2ElementsWithCorrectContent() {
        var ll = ForwardLinkedList(1,2,3)

        ll.removeSubrange(2...2)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [1,2])
    }
    
    func test_removeSubrange_with3ElementsInListAndRemoveTailing2Elements_shouldListWith1ElementsWithCorrectContent() {
        var ll = ForwardLinkedList<Int>([1,2,3])

        ll.removeSubrange(1...2)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [1])
    }
    
    func test_removeSubrange_with3ElementsInListAndRemoveAllElements_shouldEmptyList() {
        var ll = ForwardLinkedList<Int>([1,2,3])

        ll.removeSubrange(0...2)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func test_removeSubrange_with3ElementsInListAndRemoveLeading2Elements_shouldListWith1ElementsWithCorrectContent() {
        var ll = ForwardLinkedList<Int>([1,2,3])

        ll.removeSubrange(0...1)
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [3])
    }
    

    
    func test_removeSubrange_with4ElementsInListAndRemove2MidElements_shouldListWith2ElementsWithCorrectContent() {
        var ll = ForwardLinkedList(1,2,3,4)

        ll.removeSubrange(1...2)
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [1,4])
    }
    
    func test_removeSubrange_with1ElementsInListAndRemove1Element_shouldEmptyList() {
        var ll = ForwardLinkedList<Int>([1])

        ll.removeSubrange(0...0)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func test_removeSubrange_with2ElementsInListAndRemove2Elements_shouldEmptyList() {
        var ll = ForwardLinkedList(1, 2)

        ll.removeSubrange(0...1)
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }

    // MARK: Reverse
    
    func test_reverse_withEmptyList_shouldEmptyList() {
        let ll = ForwardLinkedList<Int>()
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 0)
        XCTAssertEqual(Array<Int>(ll), [])
    }
    
    func test_reverse_withListContaining1Element_shouldReturnIdenticalList() {
        let ll = ForwardLinkedList(123)
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 1)
        XCTAssertEqual(Array<Int>(ll), [123])
    }

    func test_reverse_withListContaining2Elements_shouldReturnReversedList() {
        let ll = ForwardLinkedList(123,321)
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 2)
        XCTAssertEqual(Array<Int>(ll), [321, 123])
    }
    
    func test_reverse_withListContaining3Elements_shouldReturnReversedList() {
          let ll = ForwardLinkedList(0,1,2)
          
          ll.reverse()
          
          XCTAssertEqual(ll.count, 3)
          XCTAssertEqual(Array<Int>(ll), [2,1,0])
      }
      
    
    
    func test_reverse_withListContaining6Elements_shouldReturnReversedList() {
        let ll = ForwardLinkedList(1, 1, 2, 3, 5, 8)
        
        ll.reverse()
        
        XCTAssertEqual(ll.count, 6)
        XCTAssertEqual(Array<Int>(ll), [8, 5, 3, 2, 1, 1])
    }
    
    // MARK: Equatable
    func test_equal_with2IdenticalLists_shouldReturnTrue() {
        let ll1 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        let ll2 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        XCTAssertTrue(ll1 == ll2)
    }
    
    func test_equal_with2DifferingLists_shouldReturnFalse() {
        let ll1 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        let ll2 = ForwardLinkedList<Int>(1,2,3,4,6,5)
        XCTAssertFalse(ll1 == ll2)
    }
    func test_equal_withListsWithDifferingLength_shouldReturnFalse() {
        let ll1 = ForwardLinkedList<Int>(1,2,3,4,5,6)
        let ll2 = ForwardLinkedList<Int>(1,2,3,4,5)
        XCTAssertFalse(ll1 == ll2)
    }
    
    static var allTests = [
         ("test_Init_withSequence_shouldContainCorrectElements", test_Init_withSequence_shouldContainCorrectElements),
     ]
    
}
