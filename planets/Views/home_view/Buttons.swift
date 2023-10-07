//
//  Buttons.swift
//  planets
//
//  Created by Saw Htet Naing on 06/10/2023.
//

import UIKit
extension ViewController{
    
    func ConfigureBottomRow(){
   
        previousButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for:.normal)
        previousButton.frame = CGRect(x: self.padding, y: self.padding, width: self.padding*5, height: self.padding*3)
        nextButton.setImage(UIImage(systemName: "arrowshape.right.fill"), for:.normal)
    
    }
    
    func onTapPrevious(){
        if(self.currentIndex == 0){
            self.previousButton.isEnabled = false
            self.nextButton.isEnabled = true
           
        }else{
            self.nextButton.isEnabled = true
            self.currentIndex -= 1
            self.updateUI()
        }
    }
    func onTapNext(){
        
        if(self.currentIndex < self.planets.count-1){
            self.currentIndex+=1;
            self.previousButton.isEnabled =  true
            print(currentIndex)
            self.updateUI()
        }else{
            self.previousButton.isEnabled = true
            self.nextButton.isEnabled = false
        }

    }
}
