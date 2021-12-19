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
        
        AnimateItem(duration: 0.5, delay: 0, object: label1)
        AnimateItem(duration: 0.5, delay: 0.2, object: label2)
        AnimateItem(duration: 0.5, delay: 0.4, object: label3)
        AnimateItem(duration: 0.5, delay: 0.6, object: label4)

        
        
        UIView.animate(withDuration: 0.5) {
            self.label1.center.x += self.view.bounds.width
        }
    }
    
    func AnimateItem(duration: Double, delay: Double, object: UIView) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            object.center.x += self.view.bounds.width
        } completion: { bool in
            
        }


    }
    
}
