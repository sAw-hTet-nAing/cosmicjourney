//
//  ViewController.swift
//  planets
//
//  Created by Saw Htet Naing on 04/10/2023.
//

import UIKit
import SideMenu

class ViewController: UIViewController ,SideMenuDelegate {
 
 
    
    
    @IBOutlet weak var vloumeLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var data_card: UIView!
    
    @IBOutlet weak var datacard: UIView!
    @IBOutlet weak var plant_img: UIImageView!
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var planetDescLabel: UITextView!
   
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var wikiButton:UIButton!
    
    
    
    var planets: [PlanetModelElement] = []
    var currentIndex:Int = 0
    var wikiUrl:String = ""

    
    let padding: CGFloat = 10.0
    let apiService = ApiService();
    
    let aboutMeController = AboutMeViewController()
    let privacyPolicyController = PrivacyPolicyViewController()
    
    
    var sideMenu : SideMenuNavigationController?


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousButton.isEnabled = false
        loading()
        configuresAppBar()
        configureSideMenu()
        configureDataCard()
        ConfigureBottomRow()
        fetchPlanets()
       
        
    }
    

    
    func didSelectMenuItem(name: String,selectedIndex: Int) {
        
        sideMenu?.dismiss(animated: true,completion:nil)
        
    switch name{
    case "Home":
        self.aboutMeController.view.isHidden = true
        self.privacyPolicyController.view.isHidden = true
        navigationController?.navigationBar.isTranslucent = true
       break
    case "About Me":
        self.aboutMeController.view.isHidden = false
        self.privacyPolicyController.view.isHidden = true
        // Make the navigation bar not translucent
        navigationController?.navigationBar.isTranslucent = false

                break
    case "Privacy Policy":
        self.aboutMeController.view.isHidden = true
        self.privacyPolicyController.view.isHidden = false
        // Make the navigation bar not translucent
        navigationController?.navigationBar.isTranslucent = false

        break
    default:
      return
    
    }
    


    }
    func updateUI(){
        let activePlanet = planets[currentIndex]
        planetName.text = activePlanet.name
        vloumeLabel.text = activePlanet.basicDetails.volume
        massLabel.text = activePlanet.basicDetails.mass
        planetDescLabel.text = activePlanet.description
        if let imageUrl = URL(string: activePlanet.imgSrc.img) {
            self.loadImage(from: imageUrl)
            
            
        }
        wikiUrl = activePlanet.wikiLink
        self.pageControl.numberOfPages = self.planets.count
        self.pageControl.currentPage = self.currentIndex
        
        
        
    }
    
    func loading(){
        activeIndicator.isHidden = true
        planetName.isHidden = true
        planetDescLabel.isHidden = true
        vloumeLabel.isHidden = true
        massLabel.isHidden = true
        plant_img.isHidden = true
        pageControl.isHidden = true
        datacard.isHidden = true
        previousButton.isHidden = true
        nextButton.isHidden = true
    }
    func loaded(){
        activeIndicator.isHidden = true
        
        planetName.isHidden = false
        planetDescLabel.isHidden = false
        vloumeLabel.isHidden = false
        massLabel.isHidden = false
        plant_img.isHidden = false
        pageControl.isHidden = false
        datacard.isHidden = false
        previousButton.isHidden = false
        nextButton.isHidden = false
    }
    
    @IBAction func onTapNext(_ sender: Any) {
        onTapNext()
    }
    
    
    @IBAction func onTapPrevious(_ sender:Any){
      onTapPrevious()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wikiSegue" {
            if let wikiVC = segue.destination as? WikiViewController {
                wikiVC.wikiUrl = wikiUrl
            }
        }
       
    }
    
    @IBAction func gotoWiki(_ sender:Any){
        wikiUrl = planets[self.currentIndex].wikiLink
        performSegue(withIdentifier: "wikiSegue", sender: self)
        
    }
}
