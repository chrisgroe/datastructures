//
//  Queue.swift
//  mapster
//
//  Created by Christian Gröling on 14.04.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation

struct QueueArray<T> : Queue {
    typealias Element = T
    
    var queue = [Element]()
    
    mutating func push(_ element: Element) {
        queue.append(element)
    }
    
    mutating func pop() -> Element? {
        if queue.isEmpty {
            return nil
        }
        return queue.removeLast()
    }
    
    
}
