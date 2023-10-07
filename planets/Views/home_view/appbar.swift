//
//  appbar.swift
//  planets
//
//  Created by Saw Htet Naing on 04/10/2023.
//


import UIKit

extension ViewController{

    
    func configuresAppBar(){
        title = "Cosmic Journey"
        let titleFont = UIFont.systemFont(ofSize: 20,weight: UIFont.Weight.bold)
        
        if let navigationBar = navigationController?.navigationBar {
            // Set the navigation bar title color to white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                 
        NSAttributedString.Key.font :titleFont]
            
        

    
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: UIBarButtonItem.Style.plain, target:self, action: #selector(OnTapDrawer))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        
    }
    
    @objc func OnTapDrawer(){
        present(self.sideMenu!, animated: true)
    }
}


