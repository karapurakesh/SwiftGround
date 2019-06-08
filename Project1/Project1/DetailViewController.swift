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
        // Do any additional setup after loading the view.
    }


}
