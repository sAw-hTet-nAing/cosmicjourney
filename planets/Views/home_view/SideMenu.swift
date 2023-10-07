//
//  SideMenu.swift
//  planets
//
//  Created by Saw Htet Naing on 07/10/2023.
//

import UIKit
import SideMenu

extension ViewController{
    
    
    func configureSideMenu(){
        let menu = SideMenuTabelViewController(with: [SideMenuModel(icon: UIImage(systemName: "house.circle")!, title: "Home"),SideMenuModel(icon: UIImage(systemName:"person.circle")!, title: "About Me"),
                                                      SideMenuModel(icon: UIImage(systemName:"network.badge.shield.half.filled")!, title: "Privacy Policy")])
        self.sideMenu = SideMenuNavigationController(rootViewController: menu)
        menu.delegate = self
        
        self.sideMenu!.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = self.sideMenu!
        addChildView()
        
        
        
    }
    
    func addChildView(){
        addChild(self.aboutMeController)
        addChild(self.privacyPolicyController)
        
        view.addSubview(self.aboutMeController.view)
        view.addSubview(self.privacyPolicyController.view)
        
        self.aboutMeController.view.frame = view.bounds
        self.privacyPolicyController.view.frame = view.bounds
        
        self.privacyPolicyController.didMove(toParent: self)
        self.aboutMeController.didMove(toParent: self)
        
        self.aboutMeController.view.isHidden = true
        self.privacyPolicyController.view.isHidden = true
    }
}
