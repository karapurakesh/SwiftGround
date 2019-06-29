//
//  ViewController.swift
//  Project5
//
//  Created by rakesh karapu on 22/06/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
 
    var websites = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Select Your Website"
        websites += ["apple.com","hackingwithswift.com","google.com"]
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebsitesCell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let detail = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            detail.selectedWebsite = websites[indexPath.row]
            navigationController?.pushViewController(detail, animated: true)
            
        }
        
    }
    
    
    
    


}

