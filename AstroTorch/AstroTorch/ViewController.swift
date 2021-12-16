//
//  ViewController.swift
//  AstroTorch
//
//  Created by İbrahim Demirci on 16.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    var isRed = false
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func MyButtonClicked(_ sender: Any) {
        
        if isRed{
            self.view.backgroundColor = UIColor.blue
           
            
        } else {
            self.view.backgroundColor = .red
           
        }
        isRed = !isRed
        
    }
    
}

