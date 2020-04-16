//
//  File.swift
//  
//
//  Created by Christian Gröling on 16.04.20.
//

import Foundation

public protocol Stack {
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    
}
