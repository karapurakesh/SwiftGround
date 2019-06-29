//
//  DetailViewController.swift
//  Project5
//
//  Created by rakesh karapu on 22/06/19.
//  Copyright © 2019 rakesh karapu. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate{
    
    var selectedWebsite : String?
    var webview : WKWebView?

    override func loadView() {
        webview = WKWebView()
        webview?.navigationDelegate = self
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let webTitle = selectedWebsite {
//
//            title = webTitle
//        }
        
   
        let url = URL(string: "https://"+selectedWebsite!)
        webview?.load(URLRequest(url: url!))
        webview?.allowsBackForwardNavigationGestures = true
        
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        
        let back = UIBarButtonItem(title: "Back", style: .plain, target: webview, action: #selector(webview?.goBack))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: webview, action: #selector(webview?.goForward))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webview, action: #selector(webview?.reload))
        toolbarItems = [back,space,forward,space, refresh]
        navigationController?.isToolbarHidden = false
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            print("Host:",host)
            
            if host.contains("google.com") {
                
                decisionHandler(.cancel)
                
                let ac = UIAlertController(title: "Selected Website Blocked", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    
                    
                   self.navigationController?.popViewController(animated: true)
                    
                }))
                
                present(ac,animated: true)
                
                return
            }
        }
        
        decisionHandler(.allow
        )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
