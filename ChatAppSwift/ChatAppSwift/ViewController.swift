//
//  ViewController.swift
//  ChatAppSwift
//
//  Created by İbrahim Demirci on 24.12.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    
    var messages: [DataSnapshot]! = [DataSnapshot]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        // logout
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//        } catch let signoutError as NSError{
//            print("error signing out")
//        }
        
        let currentUser = Auth.auth().currentUser
        if currentUser == nil {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "firebaseLoginViewController")
            self.navigationController?.present(vc!, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",for: indexPath)
        let messageSnap: DataSnapshot = self.messages[indexPath.row]
        let message = messageSnap.value as! Dictionary<String,String>
        let text = message["text"] as! String
        cell.textLabel?.text = text
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        self.textField.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("ended editing")
        self.view.endEditing(false)
        return true
    }


}

