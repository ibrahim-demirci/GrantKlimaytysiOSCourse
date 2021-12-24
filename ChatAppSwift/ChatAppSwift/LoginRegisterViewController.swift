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
        
        if !ChechInputs() {
            return
        }
        let email = emailTextField.text
        let password = passwordTextField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { authResult, error in
            if let error = error {
                Utilities().showAlert(title: "Error", message: error.localizedDescription, vc: self)
                print(error.localizedDescription)
                return
            }
            else {
                print("signed in")
            }
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        if !ChechInputs() {
            return
        }
        let alert = UIAlertController(title: "Register", message: "Please confirm password", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { textField in
            textField.placeholder = "Password"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action) -> Void in
            let passConfirm = alert.textFields![0] as UITextField
            if passConfirm.text!.isEqual(self.passwordTextField.text!){
                let email  =  self.emailTextField.text
                let pass = self.passwordTextField.text
                
                Auth.auth().createUser(withEmail: email!, password: pass!) { user, error in
                    if let error = error {
                        Utilities().showAlert(title: "Error", message: error.localizedDescription, vc: self)
                        return
                    }
                    else {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
            else {
                Utilities().showAlert(title: "Error", message: "Passwords not the same!", vc: self)
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func ChechInputs() -> Bool {
        if emailTextField.text?.count ?? 0 < 5 {
            emailTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.5)
            return false
        }
        else {
            emailTextField.backgroundColor = .white
        }
        if passwordTextField.text?.count ?? 0 < 5 {
            passwordTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.5)
            return false
        }
        else {
            passwordTextField.backgroundColor = .white
        }
        return true
    }
    
    @IBAction func forgotClicked(_ sender: Any) {
        
        if let email = emailTextField.text {
            if !email.isEmpty {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        Utilities().showAlert(title: "Error", message: error.localizedDescription, vc: self)
                    }
                    else {
                        Utilities().showAlert(title: "Success", message: "Please check your email box.", vc: self)
                    }
                }
            }
        }
    }
}
