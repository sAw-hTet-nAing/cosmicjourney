//
//  AboutMeViewController.swift
//  planets
//
//  Created by Saw Htet Naing on 07/10/2023.
//

import UIKit
import WebKit

class AboutMeViewController: UIViewController {
    var url:String = "https://saw-htet-naing.github.io/my_portforlio/#/"
    let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()

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
