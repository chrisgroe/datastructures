//
//  Queue.swift
//  mapster
//
//  Created by Christian Gröling on 13.04.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation

/// Each queue must conform to this protocol
protocol Queue  {
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}
