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
        print("convert clicked")
    }
    
}

