//
//  Home_Api.swift
//  planets
//
//  Created by Saw Htet Naing on 05/10/2023.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher

extension ViewController{
    

   
    func fetchPlanets(){
        activeIndicator.isHidden = false
           activeIndicator.startAnimating()
        apiService.fetchPlanets { result in
            switch result {
            case .success(let planets):
                self.planets.append(contentsOf: planets)
                print(String(self.planets.count))
                self.updateUI()
                
                self.activeIndicator.stopAnimating()
                self.loaded()

            case .failure(let error):
                self.activeIndicator.stopAnimating()
                          self.activeIndicator.isHidden = true
                // Handle the error
                print("Error fetching planets: \(error)")
            }
        }
        
    }
    
  
    func loadImage(from url: URL) {
        
      
              plant_img.kf.setImage(with: url, placeholder:UIImage(systemName: "photo.circle" ),
                                    options: [
                                 
                                        .transition(.fade(1)),
                                        .cacheOriginalImage
                                    ], progressBlock: nil) { result in
            switch result {
             
            case .success(let imageResult):
                
                    self.plant_img.image = imageResult.image
                         case.failure(let error):
                // Handle the image loading error
                print("Error loading image: \(error)")
            }
        }
    }
}
