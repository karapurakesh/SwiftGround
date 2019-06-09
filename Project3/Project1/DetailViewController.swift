//
//  DetailViewController.swift
//  Project1
//
//  Created by rakesh karapu on 05/06/19.
//  Copyright © 2019 Rakesh Karapu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage: String?
    var selectedImageTitle: String?

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageview.image = UIImage(named: imageToLoad)
        }
        
        title = selectedImageTitle
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        // Do any additional setup after loading the view.
    }
    
  @objc  func shareTapped() {
        
        guard let image = imageview.image?.jpegData(compressionQuality: 0.8) else {
            print("No Image Found")
            return
        }
    
    guard let imageTitle = selectedImageTitle else {
        return
    }
        let vc = UIActivityViewController(activityItems: [image,imageTitle], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
