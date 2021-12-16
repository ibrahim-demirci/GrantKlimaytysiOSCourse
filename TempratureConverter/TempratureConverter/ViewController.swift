//
//  ViewController.swift
//  TempratureConverter
//
//  Created by İbrahim Demirci on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempEntry: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertClicked(_ sender: Any) {

        if let result = tempEntry.text{
            if result == ""{
                return
            }
            else {
                if let num = Double(result){
                    let output = num * (9/5) + 32
                    resultLabel.text = String(output)
                }
                
                
            }
        }
    }
    
}

