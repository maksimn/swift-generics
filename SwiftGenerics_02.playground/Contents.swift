// MARK: - Задача 2

protocol Container {
    
    associatedtype T
    
    mutating func append(_ item: T)
    
    var count: Int { get }
    
    subscript(_ i: Int) -> T { get }
}

class List<T> : Container {
    
    private var size: Int = 0
    
    private var first: Node?
    private var last: Node?

    func append(_ item: T) {
        let node = Node(item)
        
        if first == nil {
            first = node
            last = node
        } else {
            last?.next = node
            last = node
        }
        
        size += 1
    }
    
    var count: Int {
        return size
    }
    
    subscript(i: Int) -> T {
        get {
            var node = first
            var j = 0
            
            while (i != j && j < size) {
                node = node?.next
                j += 1
            }
            
            return (node?.value)!
        }
    }
    
    func removeFirstElement() {
        first = first?.next
        size -= 1
    }
    
    private class Node {
        var value: T?
        var next: Node?
        
        init(_ val: T) {
            value = val
        }
    }
}

class Queue<T> : Container {
    
    private let list = List<T>()
    
    func append(_ item: T) {
        list.append(item)
    }
    
    var count: Int {
        return list.count
    }
    
    subscript(i: Int) -> T {
        return list[i]
    }
    
    func enqueue(_ item: T) {
        append(item)
    }
    
    func dequeue() -> T {
        let val = list[0]
        
        list.removeFirstElement()
        
        return val
    }
}

func integerListTest() {
    let intList = List<Int>()
    
    intList.append(34)
    intList.append(98)
    intList.append(4093)
    
    print("BEGIN integerListTest()")
    print("intList.count = \(intList.count)")
    print("intList[0] = \(intList[0])")
    print("intList[1] = \(intList[1])")
    print("intList[2] = \(intList[2])")
    
    print("intList.removeFirstElement()")
    intList.removeFirstElement()
    print("intList[0] = \(intList[0])")
    print("intList.count = \(intList.count)")
    // print("intList[3] = \(intList[3])")
    print("END integerListTest()")
}

func queueTest() {
    print("BEGIN queueTest()")
    
    let someQueue = Queue<String>()
    
    someQueue.enqueue("AA")
    someQueue.enqueue("BB")
    someQueue.enqueue("CC")
    someQueue.enqueue("DD")
    
    print("someQueue.count = \(someQueue.count)")
    
    let val1 = someQueue.dequeue()
    let val2 = someQueue.dequeue()
    
    someQueue.enqueue("EE")
    
    print("someQueue.dequeue() = \(val1)")
    print("someQueue.dequeue() = \(val2)")
    print("someQueue.dequeue() = \(someQueue.dequeue())")
    print("someQueue.dequeue() = \(someQueue.dequeue())")
    print("someQueue.dequeue() = \(someQueue.dequeue())")
    print("someQueue.count = \(someQueue.count)")
    print("END queueTest()")
}

integerListTest()
queueTest()

print("COMPLETED SUCCESFULLY.")
