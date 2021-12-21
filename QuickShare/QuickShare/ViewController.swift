//
//  ViewController.swift
//  QuickShare
//
//  Created by İbrahim Demirci on 21.12.2021.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var assetCollection: PHAssetCollection?
    var photos: PHFetchResult<PHAsset>?
    
    
    let reuseIdentifier = "tableViewCell"
    var dummyObjects = ["hi","there","i'm","awesome"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let collection = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        if collection.firstObject != nil {
            self.assetCollection = collection.firstObject! as PHAssetCollection
            
            let options = PHFetchOptions()
            options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            
            self.photos = PHAsset.fetchAssets(in: assetCollection!, options: options)
        }
        else {
            print("nothing found")
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell
        
        
        if let asset = self.photos?[indexPath.row] {
            PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 320, height: 240), contentMode: .aspectFill, options: nil) { result, info in
                if let image = result {
                    cell.myImageView.image = image
                }
            }
        }
//        cell.myImageView.image = UIImage(named: "polaroid")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if id == "showFullImageSegue" {
                let newVC = segue.destination as! ShowImageViewController
                newVC.passedString = "Whats up!"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? dummyObjects.count
    }
    

}

