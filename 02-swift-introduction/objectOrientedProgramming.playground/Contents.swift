//: Playground - noun: a place where people can play

import UIKit

class Person{
    var firstname = "Alex"
    var lastname = "Comu"
    private var _age = 0
    
    var age: Int{
        return _age
    }
    
    func setAge(newAge: Int) {
        self._age = newAge
    }
    
    var fullname: String{
        return "\(firstname) \(lastname) is \(age)"
    }
}

var alex = Person()
print(alex.fullname)
alex.setAge(newAge: 27)
print(alex.fullname)

func changeAgeFromObject(person: Person, age: Int){
    person.setAge(newAge: age)
}

changeAgeFromObject(person: alex, age: 30)
print(alex.fullname)


