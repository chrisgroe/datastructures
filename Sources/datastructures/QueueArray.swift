//
//  Queue.swift
//  mapster
//
//  Created by Christian Gröling on 14.04.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation

public struct QueueArray<T>: Queue {
    public typealias Element = T

    var queue = [Element]()

    public init() {
    }

    public mutating func push(_ element: Element) {
        queue.append(element)
    }

    public mutating func pop() -> Element? {
        if queue.isEmpty {
            return nil
        }
        return queue.removeLast()
    }

}
