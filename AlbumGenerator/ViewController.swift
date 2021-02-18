//
//  ViewController.swift
//  AlbumGenerator
//
//  Created by Chris Eccleston on 2/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    
    @IBAction func albumTapped(_ sender: Any) {
        loadAlbumImage()
    }
    
    var testImageNumber:UInt = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAlbumImage()
    }
    
    func loadAlbumImage() {
        if UIApplication.isRunningTest {
            albumImage.image = UIImage(named: "testingImage\(testImageNumber)")
            testImageNumber = (testImageNumber % 2) + 1
            return
        }
        
        let imageUrlString = "https://picsum.photos/500/"
        guard let imageUrl:URL = URL(string: imageUrlString) else {
            return
        }
        
        DispatchQueue.global().async { [weak self, weak weakImage = albumImage] in
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        weakImage?.image = nil
                        weakImage?.image = image
                    }
                }
            }
        }
    }
}
