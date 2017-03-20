import UIKit

// functions to add 1 to an input value
// Int type
func intAdder(number: Int) -> Int {
    return number + 1
}

// Double type
func doubleAdder(number: Double) -> Double {
    return number + 1
}

intAdder(number: 15)
doubleAdder(number: 15.0)

// same function implemented with generics
func genericAdder<T: Strideable>(number: T) -> T {
    return number + 1
}

genericAdder(number: 15)
genericAdder(number: 15.0)

// function to double a number
// Int type
func intMultiplier(lhs: Int, rhs: Int) -> Int {
    return lhs * rhs
}

// Double type
func doubleMultiplier(lhs: Double, rhs: Double) -> Double {
    return lhs * rhs
}

intMultiplier(lhs: 2, rhs: 5)
doubleMultiplier(lhs: 2.0, rhs: 5.0)

//: Create a protocol to handle multiplication
//: so we can use generics
protocol Numeric {
    func *(lhs: Self, rhs: Self) -> Self
}
// Add extensions to the types we want to support
extension Double: Numeric {}
extension Float: Numeric {}
extension Int: Numeric {}

//: Now genericMultiplier will work with any number
//: type we have extended (In this case, Double, Float
//: and Int)
func genericMultiplier<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

genericMultiplier(lhs: 2.1, rhs: 5)
genericMultiplier(lhs: 5, rhs: 5)


