//
//  ViewController.swift
//  ChatAppSwift
//
//  Created by İbrahim Demirci on 24.12.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // logout
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signoutError as NSError{
            print("error signing out")
        }
        
        let currentUser = Auth.auth().currentUser
        if currentUser == nil {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "firebaseLoginViewController")
            self.navigationController?.present(vc!, animated: true, completion: nil)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

