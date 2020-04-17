//
//  Node.swift
//  
//
//  Created by Christian Gröling on 17.04.20.
//

import Foundation

class ForwardLinkedListNode<T> {
    typealias Element = T
    var data: Element
     var next: ForwardLinkedListNode<T>?

     init(data: Element) {
         self.data = data
         self.next = nil
     }
 }
