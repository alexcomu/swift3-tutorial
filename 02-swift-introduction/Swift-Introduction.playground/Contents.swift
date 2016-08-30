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

