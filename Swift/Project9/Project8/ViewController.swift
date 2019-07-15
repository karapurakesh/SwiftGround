//
//  ViewController.swift
//  Project8
//
//  Created by rakesh karapu on 11/07/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Codable"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //The below chunk of code can be run in BG using GCD or Perform selectors. Find the below global queue for GCD. Instead Perform selector, we can keep the code in below closure.
        
        //DispatchQueue.global(qos: .userInitiated).async { [weak self] in
        //}

        
        performSelector(inBackground: #selector(fetchJson), with: nil)
        
        fetchJson()
        
        
    }
    
    @objc func fetchJson(){
        
        let urlString = "https:www.hackingwithswift.com/samples/petitions-1.json"
        
        
        //DispatchQueue.global(qos: .userInitiated).async { [weak self] in
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        //}
    }
    
    @objc func showError() {
        
        //  DispatchQueue.main.async { [weak self] in
        let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed.Please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        // }
        
    }
    
    func parse(json : Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            //            DispatchQueue.main.async { [weak self] in
            //                self?.tableView.reloadData()
            //
            //            }
            
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
}

