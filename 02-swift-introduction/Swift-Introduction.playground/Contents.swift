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




