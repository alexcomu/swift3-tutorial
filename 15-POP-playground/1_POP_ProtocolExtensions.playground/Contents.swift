import UIKit

protocol Vehicle: CustomStringConvertible {
    var isRunning: Bool { get set }
    var description: String { get }
    var make: String { get set }
    var model: String { get set }
}

extension Vehicle {
    var makeModel: String {
        return "\(make) \(model)"
    }
    
    mutating func start() {
        if isRunning {
            print("Already started!")
        } else {
            isRunning = true
            print("\(self.description) fired up!")
        }
    }
    
    mutating func turnOff() {
        if isRunning {
            isRunning = false
            print("\(self.description) shut down!")
        } else {
            print("Already dead")
        }
    }
}

struct SportsCar: Vehicle {
    var isRunning: Bool = false
    var make: String
    var model: String
    
    var description: String {
        return self.makeModel
    }
}

class SemiTruck: Vehicle {
    var isRunning: Bool = false
    var make: String
    var model: String
    
    init(isRunning: Bool, make: String, model: String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String {
        return self.makeModel
    }
    
    func blowAirHorn() {
        print("TOOOOOOT :)")
    }
}

var car1 = SportsCar(isRunning: false, make: "Porsche", model: "911")
var truck1 = SemiTruck(isRunning: false, make: "Peterbuilt", model: "Verago")

car1.start()

truck1.start()
truck1.blowAirHorn()


car1.turnOff()
truck1.turnOff()






// extension of an existing type
extension Double {
    var dollarString: String {
        return String(format: "$%.02f", self)
    }
}

var pct = 32.15 * 0.15
pct.dollarString




