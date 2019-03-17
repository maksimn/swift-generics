import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментиррованный код работал"

func sumTwoValues<T: Numeric>(_ a: T, _ b: T) -> T {
	let result = a + b
	return result
}

//func sumTwoValues(_ a: String, _ b: String) -> String {
//    let result = a + b
//    return result
//}

extension Numeric where Self = String {
    static func +(l: Self, r: String) -> String {
        return l + r;
    }
}

let a = 25.2
let b = 34.6

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
