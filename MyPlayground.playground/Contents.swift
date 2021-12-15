import UIKit



func CheckCount(message: String, pCount: Int) -> String{
    
    var count : Int = pCount
    while count < 10 {
        print(message)
        count = count + 1
    }
    
    return "Done!"

}

CheckCount(message: "not yet ",pCount: 0)





