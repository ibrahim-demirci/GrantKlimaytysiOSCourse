//
//  Utilities.swift
//  ChatAppSwift
//
//  Created by İbrahim Demirci on 25.12.2021.
//

import Foundation
import UIKit

class Utilities {
    func showAlert (title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
                    
    }
}
