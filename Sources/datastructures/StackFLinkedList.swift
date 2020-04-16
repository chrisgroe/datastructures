//
//  Stack.swift
//  mapster
//
//  Created by Christian Gröling on 10.04.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation

/// A stack (Last-In First-Out) datastructure.
public struct StackFLinkedList<T> : Stack {
    public typealias Element = T
    typealias ContainerType = ForwardLinkedList<T>
    
    fileprivate var container = ContainerType()
    
    /// Initializes an empty stack
    public init()
    {
    }
    
    
    /// Initializes the stack with a sequence
    ///
    /// Element order is [bottom, ..., top], as if one were to iterate through the sequence in reverse.
    public init<S>( _ s: S) where Element == S.Element, S : Sequence
    {
        
        for i in s {
            self.container.prepend(i)
        }
    }
    
    /// Initializes the stack with variadic parameters
    ///
    /// Element order is (bottom, ..., top),  as if one were to iterate through the sequence in reverse.
    init(container : ContainerType = ContainerType(), _ values: Element...) {
        
        self.container = container
        
        for i in values {
            self.container.prepend(i)
        }
    }
    
    /// Pushes an element to the top of the stack
    /// - Parameters:
    ///     - element: The element to be pushed.
    public func push(_ element: Element) {
        container.prepend(element)
    }
    
    /// Removes the top element from stack and returns it.
    ///
    /// This method reduces the size of the stack by 1.
    /// - Returns:The top element of the stack or nil when the stack is empty.
    public func pop() -> Element? {
        if isEmpty {
            return nil
        }
        
        return container.removeFirst()
    }
    
    /// The top element of the stack.
    ///
    /// This is the last one pushed to the the stack or nil when the stack is empty.
    var front: Element? {
        return container.first
    }
    
    /// The number of elements currently contained in the stack
    var count: Int {
        return container.count
    }
    
    /// True when the stack is empty
    var isEmpty: Bool {
        return container.isEmpty
    }
    
    
    
}


// MARK: - GeneratorType
extension StackFLinkedList: IteratorProtocol {

    mutating public func next() -> Element? { return pop() }
}

// MARK: - SequenceType
extension StackFLinkedList: Sequence {
    
    public typealias Iterator = StackFLinkedList
    public func makeIterator() -> Iterator { return self }
}
