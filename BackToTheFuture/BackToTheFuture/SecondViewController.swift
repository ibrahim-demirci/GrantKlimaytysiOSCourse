//
//  SecondViewController.swift
//  BackToTheFuture
//
//  Created by İbrahim Demirci on 18.12.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ButtonClicked(_ sender: Any) {
        
        let utils = Utilities()
        let year = utils.GetRandomYear()
        
        label1.text = utils.GetLetterAtIndex(str: year, location: 0)
        label2.text = utils.GetLetterAtIndex(str: year, location: 1)
        label3.text = utils.GetLetterAtIndex(str: year, location: 2)
        label4.text = utils.GetLetterAtIndex(str: year, location: 3)

    }
    
}
