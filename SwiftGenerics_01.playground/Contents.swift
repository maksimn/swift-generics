import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментиррованный код работал"

func sumTwoValues<T>(_ a: T, _ b: T,_ summator: (T, T) -> T) -> T {
	return summator(a, b)
}

let a = 25.2
let b = 34.6

let resultDouble = sumTwoValues(a, b, { (u, v) -> Double in u + v })
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d, { (u, v) -> String in u + v })
print(resultString)
