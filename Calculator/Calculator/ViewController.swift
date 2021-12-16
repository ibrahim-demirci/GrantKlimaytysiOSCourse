//
//  ViewController.swift
//  Calculator
//
//  Created by İbrahim Demirci on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Button actions
    @IBAction func numberClicked(_ sender: UIButton){
        
    }
    @IBAction func operatorClicked(_ sender: UIButton){
        switch sender.tag {
        case 10:
            print("add")
        case 11:
            print("minus")
        case 12:
            print("multiply")
        case 13:
            print("divide")
        default:
            return
        }
        
    }
    @IBAction func equalsClicked(_ sender: UIButton){
        
    }


}

