//
//  LoginRegisterViewController.swift
//  ChatAppSwift
//
//  Created by İbrahim Demirci on 24.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginRegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }

    @IBAction func loginClicked(_ sender: Any) {
        if emailTextField.text?.count ?? 0 < 5 {
            emailTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.5)
            return
        }
        else {
            emailTextField.backgroundColor = .white
        }
        if passwordTextField.text?.count ?? 0 < 5 {
            passwordTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.5)
            return
        }
        else {
            passwordTextField.backgroundColor = .white
        }
        
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            else {
                print("signed in")
            }
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
    }
    
    @IBAction func forgotClicked(_ sender: Any) {
    }
}
