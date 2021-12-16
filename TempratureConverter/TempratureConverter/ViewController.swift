//
//  ViewController.swift
//  TempratureConverter
//
//  Created by İbrahim Demirci on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var conversionsCount = 0
    
    @IBOutlet weak var tempEntry: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var conversionsLabel: UILabel!
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
                    updateCountByOne()
                    
                }
                
                
            }
        }
    }
    
    func updateCountByOne() {
        conversionsCount += 1
        conversionsLabel.text = String(conversionsCount) + " conversions"
    }
    
}

