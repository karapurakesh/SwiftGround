//
//  ViewController.swift
//  Project2
//
//  Created by rakesh karapu on 08/06/19.
//  Copyright © 2019 SwiftGround. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestions = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france","germany","ireland","italy",
                      "monaco","nigeria", "poland", "russia",
        "spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .edit, target: self, action:
            #selector(ShowScore))
    }
    
    func askQuestion(actoin: UIAlertAction! = nil) {
        
        if totalQuestions == 10 {
            
            let ac = UIAlertController(title: "Total Questions Asked \(totalQuestions)", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default
                , handler: { (UIAlertAction) in
                    
            }))
            
            present(ac, animated: true)
            
        }else {
            
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            totalQuestions += 1
            
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            title = "Q:\(totalQuestions) / \(countries[correctAnswer].uppercased()) / Your score is : \(score)"
        }
        
    }
    
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }else {
            title = "Wrong! That’s the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        
    }
    
    @objc func ShowScore(){
        let ac = UIAlertController(title: "Your Score", message: "\(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            
        }))
        
        present(ac,animated: true)
    }
}

