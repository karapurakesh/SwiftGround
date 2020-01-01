//
//  ViewController.swift
//  ProtocolBasedSections
//
//  Created by rakesh karapu on 31/12/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
  
    weak var customTableView: DrawView!
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let customView = Bundle.main.loadNibNamed("DrawView", owner: nil, options: nil)?.first as? DrawView
     //   let cell = UINib(nibName: "DropdownlistWithTitleCell", bundle: nil)
        customView?.tableView.register(DropdownListTableViewCell.self, forCellReuseIdentifier: cellId)

        self.view.addSubview(customView!)
    }
    
}

