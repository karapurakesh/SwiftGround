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
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageview.image = UIImage(named: imageToLoad)
        }
        
        title = selectedImage
        
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//        self.viewWillAppear(animated)
//       // navigationController?.hidesBarsOnTap = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        self.viewWillDisappear(animated)
//      //  navigationController?.hidesBarsOnTap = false
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
