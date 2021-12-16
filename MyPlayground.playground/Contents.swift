import UIKit



class Car {
    let numWheels: Int
    
    init(numWheels: Int) {
        self.numWheels = numWheels
    }
}

class FamilyCar: Car{
    let numDoors = 5
}

class BigFamilyCar: FamilyCar{
    var size = "Large"
}

var bigCar = BigFamilyCar(numWheels: 6)
bigCar.size
bigCar.numDoors
bigCar.numWheels

