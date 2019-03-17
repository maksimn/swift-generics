// MARK: - Задача 2

protocol Container {
    
    associatedtype T
    
    mutating func append(_ item: T)
    
    var count: Int { get }
    
    subscript(_ i: Int) -> T { get }

}

