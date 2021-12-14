import UIKit


var myNum = 32

if myNum == 33{
    print(myNum)
} else if myNum > 33{
    print("old man")
} else {
    print("Young man!")
}


switch myNum {
case 33:
    print(myNum)
case 0..<33:
    print("Young men!")
default:
    print("old")
    
}
