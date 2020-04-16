//
//  StackContainerProtocol.swift
//  mapster
//
//  Created by Christian Gröling on 10.04.20.
//  Copyright © 2020 Christian Gröling. All rights reserved.
//

import Foundation

protocol StackContainer {
    
    associatedtype Element
    
    init()
    
    func prepend(_ element : Element)
    func removeFirst() -> Element
    
    var first : Element? {
        get
    }
    
    var count : Int {
        get
    }
    
    var isEmpty : Bool {
        get
    }
}
