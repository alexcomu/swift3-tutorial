//: Playground - noun: a place where people can play

import UIKit

// INTRODUCTION

// ***************************************** //
// Variables

var message = "Hello, Friend"

var amIHappy = true
amIHappy = !amIHappy

var feelGood = true

feelGood = amIHappy ? true : false

var bankAccountBalance = 100

var cashMessage = bankAccountBalance > 50 ? "Great I'm rich" : "Oh F**k"

// ***************************************** //
// Strings
var str: String = "Hello, I'm a string"

// The following code is wrong! 'str' is a String Type
// str = 50

var age = 25
var firstName = "Alex"
var lastName = "Comu"
// string concatenation
var fullName = firstName + " " + lastName
// string interpolation
var fullName2 = "\(firstName) \(lastName) is \(age)"
// append str to str
fullName.append(" something more")

// capitalized
var songTitle = "bangarang - Skrillex"
songTitle = songTitle.capitalized
// lower case
var chatRoomAnnoyingCapsGuy = "AHAHAHA IS ALL CAPITALIZED"
var lowerCasedChat = chatRoomAnnoyingCapsGuy.lowercased()

var sentence = "What the hell! You're crazy!"
if sentence.contains("hell") || sentence.contains("crazy"){
    sentence = sentence.replacingOccurrences(of: "hell", with: "dog")
    sentence = sentence.replacingOccurrences(of: "crazy", with: "cat")
}


// ***************************************** //
// Numbers
var myAge: Int = 27 // this is an integer!
var someDoubleNumber: Double = 789789987878979878977897 // this is too big to be an integer!
var someMinusNumber = -56.45 // this is a double
var pi: Float = 3.14

// this is not allowed! Float = Double --> WRONG!
// pi = someMinusNumber

// Arithmetic Operators
var mul = 15 * 20

var sum = 5 + 6

var diff = 10 - 3

var div = 12 / 3

var div1 = 13 / 5

var remainder = 13 % 5

var result = "The result of 13 / 5 is \(div1) with a remainder of \(remainder)"

var randomNumber = 12

if randomNumber % 2 == 0 {
    print("this is an even number") // print out to the console
} else {
    print("this is an odd number")
}

var result2 = 15 * ((5 + 7) / 3)


// ***************************************** //
// Functions

//Shape 1
var length = 5
var width = 10

var area = length * width

//Shape 2
var length2 = 6
var width2 = 12

var area2 = length2 * width2

//Shape 3
var length3 = 3
var width3 = 8

var area3 = length3 * width3

func calculateArea(length: Int, width: Int) -> Int{
    return length * width
}

// call the function and store the results into 3 constants
let shape1 = calculateArea(length: 1, width: 2)
let shape2 = calculateArea(length: 12, width: 3)
let shape3 = calculateArea(length: 11, width: 5)

var myBankAccountBalance = 500.00
var iLikeThoseShoes = 350.00

// inout is used to pass the reference of the variable instead just the value
func purchaseItem(currentBalance: inout Double, itemPrice: Double){
    if itemPrice <= currentBalance{
        currentBalance = currentBalance - itemPrice
        print("Purchased item for: $\(itemPrice)")
    }else{
        print("Loser!")
    }
}

purchaseItem(currentBalance: &myBankAccountBalance, itemPrice: iLikeThoseShoes)

var newTShirt = 40.00
purchaseItem(currentBalance: &myBankAccountBalance, itemPrice: newTShirt)

// ***************************************** //
// Bools / conditionals / compare Operators

var isThisFileUseful = true
isThisFileUseful = false

if true == false || false == false{
    print("WTF...")
}

var isLoadingFinished: Bool = false
if !isLoadingFinished{
    print("Loading...")
}

var randomCost = 50
if randomCost > 100{
    print("WOW")
} else if randomCost == 50{
    print("I'm here")
}else{
    print("No way...")
}


// ***************************************** //
// Logical Operators

let amIAllowed = false
let butIHaveTheCode = true
if !amIAllowed{
    print("Not Allowed!")
}
if amIAllowed || butIHaveTheCode{
    print("I'm in!")
}else{
    print("Stay out")
}


// ***************************************** //
// Arrays

var peopleSalary: Array<Int> = [25000, 22000, 123] // array of integers
var randomArray: [Any] = ["asd", 123, true] // array of ANY types
randomArray.append(true)

print(peopleSalary.count)
peopleSalary.append(1)
print(peopleSalary.count)


peopleSalary.remove(at: 0)
print(peopleSalary)

var students = [String]() // create an empty array of type string -> Initialize
var students2: [String]   // this is just the declaration
students.append("Alex")
print(students)
//students2.append("ALEX") // ERROR, you need to create an instance before use it
students2 = [String]()
students2.append("Pippo")
print(students2)


// ***************************************** //
// Loops

var salaries: [Double] = [10, 12, 15, 20, 5]
print(salaries)
var index = 0
// While statement
repeat{
    salaries[index] = salaries[index] + (salaries[index] * 0.10)
    index += 1
}while(index < salaries.count)
print(salaries)

// For statement
for i in 0..<salaries.count{
    salaries[i] = salaries[i] + (salaries[i] * 0.10)
}
print(salaries)

// For each statement
for salary in salaries {
    print("Salary: \(salary)")
}


// ***************************************** //
// Dictionaries

var myDictionary = [String: Any]()
myDictionary["firstname"] = "Alex"
myDictionary["lastname"] = "Comu"
myDictionary["age"] = 27

print("My Dictionary has \(myDictionary.count) items")

// clear the dictionary
myDictionary = [:]
print(myDictionary)

if myDictionary.isEmpty {
    print("Empty Dictionary")
}else{
    print("WTF")
}

// null value
myDictionary["firstname"] = nil

myDictionary["firstname"] = "Alex"
myDictionary["lastname"] = "Comu"
myDictionary["age"] = 27

for (key, value) in myDictionary {
    print("Key: \(key) with value: \(value)")
}


for key in myDictionary.keys{
    print("Key: \(key)")
}

for value in myDictionary.values{
    print("Key: \(value)")
}

var info = [String: Array<[String: Int]>]()

info["random"] = [["alex": 1]]

for (key, value) in info {
    print("Key: \(key) value: \(value)")
}



// ***************************************** //
// Optionals
// I don't know if I have a value... so I'll use optionals!

var optionalVariable: Int?   // check this value!
//print(optionalVariable!)     // '!' is used to retrieve the value, in this case this is a crash! Because the value at the moment is nil!
optionalVariable = 500
print(optionalVariable!)        // BTW this is bad!

var lotteryWinnings: Int?
if lotteryWinnings != nil {     // this garantee that we have a value
    print(lotteryWinnings!)
}

// Preferred way -> Create a constant and assign the value
// if let
if let winnings = lotteryWinnings{
    print(winnings)
}

// Optionals example with Class (sorry if I'm using class.. see later for more information about classes)
// create class Person
class Person{
    // class has a string called name
    var name: String?
}
// create a var alex that is a Person
var alex: Person?
// print the name value --> nil
print(alex?.name)
//Create an Instance the alex Person
alex = Person()
// set the value of the name
alex?.name = "Alex"
// now we can print the value using the 'if let' way!
if let a = alex, let n = a.name{
    print(n)
}


// Other Example

class Man{
    private var _age: Int!
    
    var age: Int{
        if _age == nil{
            _age = 0
        }
        return _age
    }
    
    func setAge(newAge: Int) {
        self._age = newAge
    }
}

var comu = Man()
print(comu.age)
comu.setAge(newAge: 27)
print(comu.age)





