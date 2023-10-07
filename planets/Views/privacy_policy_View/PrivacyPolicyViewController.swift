//
//  PrivacyPolicyViewController.swift
//  planets
//
//  Created by Saw Htet Naing on 07/10/2023.
//

import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController {

    
    let url:String = "https://doc-hosting.flycricket.io/cosmic-journey-privacy-policy/ae2042b1-c35d-462b-9703-47abfbc1a1c7/privacy"
    let webView = WKWebView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
         //
        
        
      
       
        
        view.backgroundColor = .label
        view.addSubview(webView)
        guard let url = URL(string: url) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

}
