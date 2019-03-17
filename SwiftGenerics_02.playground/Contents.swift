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
        get {
            return size
        }
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
    
    private class Node {
        var value: T?
        var next: Node?
        
        init(_ val: T) {
            value = val
        }
    }
}

func integerListTest() {
    let intList = List<Int>()
    
    intList.append(34)
    intList.append(98)
    intList.append(4093)
    
    print("integerListTest()")
    print("intList.count = \(intList.count)")
    print("intList[0] = \(intList[0])")
    print("intList[1] = \(intList[1])")
    print("intList[2] = \(intList[2])")
    // print("intList[3] = \(intList[3])")
}

integerListTest()

print("COMPLETED SUCCESFULLY.")
