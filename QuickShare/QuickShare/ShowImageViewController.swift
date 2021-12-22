//
//  ShowImageViewController.swift
//  QuickShare
//
//  Created by İbrahim Demirci on 21.12.2021.
//

import UIKit
import Photos
class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var asset: PHAsset?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let myAsset = asset {
            PHImageManager.default().requestImage(for: myAsset, targetSize: CGSize(width: self.view.frame.width, height: self.view.frame.width * 0.5625), contentMode: .aspectFill, options: nil) { result, info in
                if let image = result {
                    self.imageView.image = image
                }
            }
        }
    }
    
    @IBAction func shareButtonClicked (_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("facebook")
        case 2:
            print("insta")
        case 3:
            print("twitter")
        case 4:
            print("whatsapp")
        case 5:
            print("pin")
        default:
            print("nout")
        }
    }
    


}
