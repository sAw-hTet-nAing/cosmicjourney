//
//  WikiViewController.swift
//  planets
//
//  Created by Saw Htet Naing on 07/10/2023.
//

import UIKit
import WebKit
class WikiViewController: UIViewController {

    var wikiUrl:String?
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        guard let url = URL(string: wikiUrl!) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
