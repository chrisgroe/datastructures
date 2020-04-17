import Foundation

/// Generic forward singly linked list implementation
///
/// This class can be used like an Array. It implements all major protocols an Array implements.
/// For more information, see [Linked List - Wikipedia](https://en.wikipedia.org/wiki/Linked_list)
///
/// - Note: This implemtation of the linked list is a reference type. Therefore value type semanitcs will not hold.
public class ForwardLinkedList<T> {
    public typealias Element = T
    public typealias Index = Int
    typealias Node = ForwardLinkedListNode<T>

    public var count: Int {
        return endIndex - startIndex
    }

    private var head: Node?

    /// The position of the first element in a nonempty array.
    /// - Note: The startIndex of this collection does never change
    public let startIndex: Index  = 0

    /// The array’s “past the end” position—that is, the position one greater than the last valid subscript argument.
    public var endIndex: Index = 0

    required public init() {
    }

    required public init<S>(_ sequence: S) where Element == S.Element, S: Sequence {
        var ref: Node?
        // exhaust sequence
        for seqItem in sequence {
            ref = insertNode(behind: ref, seqItem)
        }
    }

    required public init(repeating repeatedValue: Element, count: Int) {

        var ref: Node?
        for _ in 0..<count {
            ref = insertNode(behind: ref, repeatedValue)
        }
    }

    convenience public init(_ values: Element...) {
        self.init(values)
    }

    /// The first element of the LinkedList.
    ///
    /// Is nil when the LinkedList  is empty.
    public var first: Element? {
        head?.data
    }

    /// The last element of the LinkedList.
    ///
    /// Is nil  the LinkedList is empty.
    public var last: Element? {
        lastNode?.data
    }

    /// The last node in the collection
    ///
    /// Is nil when the LinkedList is empty.
    private var lastNode: Node? {
        if head == nil {
            return nil
        }

        var node = head
        while hasNext(node) {
            node = node?.next
        }
        return node
    }

    private var pennultimateNode: Node? {
        assert(head != nil)

        var node = head
        var pennu: Node?
        while hasNext(node) {
            pennu = node
            node = node?.next
        }
        return pennu
    }

    private func hasNext(_ node: Node?) -> Bool {
        node?.next != nil
    }

    private func gotoNode(at index: Int) -> Node? {
        assert((index >= startIndex) && (index<endIndex))

        // special case
        if index == 0 {
            return head
        }

        var next = head?.next
        var currIndex = 1

        while next != nil {
            if index==currIndex {
                break
            }
            next = next?.next
            currIndex+=1
        }
        return next
    }

    /// Adds a new element at the start of the LinkedList.
    /// - Parameters:
    ///     - newElement: The element to append to the LinkedList.
    public func prepend(_ newElement: Element) {
        // pack Element in Node
        let node = Node(data: newElement)

        endIndex += 1
        node.next = head
        head = node
    }

    /// Appends  a new element at the end of the LinkedList.
    /// - Parameters:
    ///     - newElement: The element to append to the LinkedList.
    public func append(_ newElement: Element) {
        if head == nil {
            insertNode(behind: nil, newElement )
        } else {
            let tail = lastNode
            insertNode(behind: tail, newElement )
        }
    }

    /// Internal method to insert a node as the next node of node.
    /// - Parameters:
    ///     - behind: The node where the new new should be inserted at.
    ///     - newElement: The element to append to the LinkedList.
    /// - Returns: the inserted node.
    @discardableResult
    private func insertNode( behind node: Node?, _ newElement: Element) -> Node {
        // pack Element in Node
        let newNode = Node(data: newElement)
        endIndex += 1
        if let nodeUw = node { // no head
            newNode.next = nodeUw.next
            nodeUw.next = newNode
        } else {
            head = newNode
        }
        return newNode
    }

    @discardableResult
    private func removeNextNode(at node: Node) -> Element? {
        let next = node.next
        assert(next != nil)

        endIndex -= 1
        let nextnext = next?.next

        node.next = nextnext

        return next?.data

    }

    /// Inserts a new element at the specified position.
    /// - Parameters:
    ///     - newElement: The element to insert into the LinkedList.
    ///     - index: The position at which to insert the new element.
    public func insert(_ newElement: Element, at index: Int ) {

        assert(index>=startIndex)

        // insert at start when collection is empty
        if count == 0 && index == startIndex {
            append(newElement)
            return
        }

        assert(count>0) // collection not empty

        let new = Node(data: newElement)

        guard index != 0 else {
            // special case ... move head
            let oldhead = head
            head = new
            head?.next = oldhead
            endIndex += 1
            return
        }

        assert(index < (endIndex + 1))

        let prev = gotoNode(at: index  - 1)

        assert(prev != nil)

        // insert at end
        if index==endIndex {
            prev?.next = new
            endIndex += 1
        } else {
            assert(index<endIndex)

            let node = prev?.next

            assert(node != nil)

            prev?.next = new
            new.next = node
            endIndex += 1
        }

    }

    /// Removes and returns the element at the specified position.
    /// - Parameters:
    ///     - index: The position of the element to remove.
    /// - Returns: The element at the specified index.
    @discardableResult public func remove(at index: Int) -> Element {
        assert(count>0) // collection not empty
        assert(index>=startIndex && index<endIndex)

        guard index != 0 else {
            // special case ... index 0 is head
            let oldHead = head
            head = head?.next // move head
            endIndex -= 1
            return oldHead!.data
        }

        let prev = gotoNode(at: index  - 1)
        return removeNextNode(at: prev!)!
    }

    /// Reverses the linked list
    /// - Complexity: O(n), where n is the length of the list
    public func reverse() {

        guard count>=2 else {
            return
        }

        var prev = head
        var node = head?.next
        prev?.next = nil

        repeat {
            let oldNext = node?.next

            node?.next = prev

            prev = node
            node = oldNext

        } while (node != nil)

        head=prev
    }
}

// MARK: - MutableCollection Protocol
extension ForwardLinkedList: MutableCollection {
    public func index(after index: Index) -> Index {
        index+1
    }

    public subscript(position: Int) -> Element {
        set {
            let node = gotoNode(at: position)
            node?.data = newValue
        }
        get {
            gotoNode(at: position)!.data
        }
    }
}

// MARK: Operators
extension ForwardLinkedList {
    public static func + (lhs: ForwardLinkedList<Element>, rhs: ForwardLinkedList<Element>)
        -> ForwardLinkedList<Element> {
        let newLl = ForwardLinkedList<Element>(lhs) // create new linked list based on lhs

        var ref: Node? = newLl.lastNode

        for rhsItem in rhs {
            ref = newLl.insertNode(behind: ref, rhsItem) // append elements from rhs
        }
        return newLl
    }

    public static func + <Other>(lhs: Other, rhs: ForwardLinkedList<Element>)
        -> ForwardLinkedList<Element> where Other: Sequence, Element == Other.Element {
        let newLl = ForwardLinkedList<Element>(lhs) // create new linked list based on lhs

        var ref: Node? = newLl.lastNode

        for rhsItem in rhs {
            ref = newLl.insertNode(behind: ref, rhsItem) // append elements from rhs
        }
        return newLl
    }

    public static func + <Other>(lhs: ForwardLinkedList<Element>, rhs: Other )
        -> ForwardLinkedList<Element> where Other: Sequence, Element == Other.Element {
        let newLl = ForwardLinkedList<Element>(lhs) // create new linked list based on lhs
        var ref: Node? = newLl.lastNode

        for rhsItem in rhs {
            ref = newLl.insertNode(behind: ref, rhsItem) // append elements from rhs
        }
        return newLl
    }
}

// MARK: - CustomStringConvertible Protocol
extension ForwardLinkedList: CustomStringConvertible where Element: CustomStringConvertible {

    public var description: String {
        var text = "["
        var nodeRef = head

        while let node = nodeRef {
            text += "\(node.data)"
            nodeRef = node.next
            if nodeRef != nil {
                text += ", "
            }
        }

        return text + "]"
    }
}

// MARK: - CustomStringConvertible Protocol
extension ForwardLinkedList: RangeReplaceableCollection {
    public func removeFirst() -> Element {
        assert(count != 0)

        let oldHead = head
        head=head?.next
        endIndex -= 1
        return oldHead!.data
    }

    public func removeFirst(_ number: Int) {
        assert(count >= number)

        for _ in 0..<number { // better performance than using node(at:)
            head = head?.next
        }
        endIndex -= number
    }

    public func removeLast() -> Element {
        assert(count != 0)
        let pennu = pennultimateNode

        endIndex -= 1
        var end: Node?

        // special case ... head exists but has no next node
        if head != nil && pennu == nil {
            end = head
            head = nil
        } else {
            end = pennu?.next
            pennu?.next = nil
        }
        return end!.data
    }

    public func removeLast(_ number: Int) {
        assert(count >= number)

        let prevIndex = endIndex - number - 1
        endIndex -= number

        if prevIndex<0 {
            head=nil
        } else {
            let prev = gotoNode(at: prevIndex)
            prev?.next = nil
        }
    }

    public func removeSubrange(_ bounds: Range<Index>) {
        assert(count != 0)
        assert(bounds.lowerBound>=startIndex)
        assert(bounds.upperBound<=endIndex)

        var fromNode: Node? = head
        if bounds.lowerBound - 1  < 0 {
            fromNode = nil
        } else {
            for _ in 0..<bounds.lowerBound - 1 { // better performance than using node(at:)
                fromNode = fromNode?.next
            }
        }
        var toNode: Node? = head
        for _ in 0..<bounds.upperBound { // better performance than using node(at:)
            toNode = toNode?.next
        }

        endIndex -= bounds.upperBound - bounds.lowerBound
        if fromNode == nil && toNode !=  nil {
            head = toNode

        } else if fromNode != nil && toNode == nil {
            fromNode?.next = nil
        } else {
            head = fromNode
            fromNode?.next = toNode
        }
    }
}

// MARK: - Equatable conformance
extension ForwardLinkedList: Equatable where Element: Equatable {
    public static func == (lhs: ForwardLinkedList<Element>, rhs: ForwardLinkedList<Element>) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }
        for (lhsItem, rhsItem) in zip(lhs, rhs) {
            guard lhsItem == rhsItem else {
                return false
            }
        }
        return true
    }
}

// MARK: - Sequence Protocol
extension ForwardLinkedList: Sequence {
    public typealias Iterator = LinkedListIterator

    public class LinkedListIterator: IteratorProtocol {
        private var head: Node?
        private var node: Node?

        fileprivate init(start: Node?, end: Node?) {
            self.head = start
            node = start
        }
        public func next() -> Element? {
            if node == nil {
                return nil
            }

            if node === head {
                head = nil
                return node?.data
            }

            node = node?.next
            return node?.data
        }
    }

    public func makeIterator() -> LinkedListIterator {
        return LinkedListIterator(start: head, end: lastNode)
    }

}
