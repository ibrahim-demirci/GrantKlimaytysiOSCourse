//
//  ViewController.swift
//  BackToTheFuture
//
//  Created by İbrahim Demirci on 18.12.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let year = Utilities().getCurrentYear()
        
        label1.text = Utilities().GetLetterAtIndex(str: year, location: 0)
        label2.text = Utilities().GetLetterAtIndex(str: year, location: 1)
        label3.text = Utilities().GetLetterAtIndex(str: year, location: 2)
        label4.text = Utilities().GetLetterAtIndex(str: year, location: 3)

        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(FirstViewController.Tick), userInfo: nil, repeats: true)
    }
    
    @objc func Tick() {
        timeLabel.text = Utilities().GetCurrentTime()
    }
    


}

