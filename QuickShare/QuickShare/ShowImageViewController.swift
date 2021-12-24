//
//  ShowImageViewController.swift
//  QuickShare
//
//  Created by İbrahim Demirci on 21.12.2021.
//

import UIKit
import Photos
import Social

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
            if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
                ShareFacebookTwitter(vc: vc)
            }
            
        case 2:
            print("insta")
        case 3:
            if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
                ShareFacebookTwitter(vc: vc)
            }
        case 4:
            print("whatsapp")
        case 5:
            print("pin")
        default:
            print("nout")
        }
    }
    
    
    func ShareFacebookTwitter(vc: SLComposeViewController) {
        vc.setInitialText("Look at this great picture!")
        vc.add(imageView.image)
        vc.add(URL( string: "https://www.learnappdevelopment.com"))
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
    


}
