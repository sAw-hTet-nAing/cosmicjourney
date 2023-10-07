//
//  SplashViewController.swift
//  planets
//
//  Created by Saw Htet Naing on 06/10/2023.
//

import UIKit
import Lottie
class SplashViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
 
    
    @IBOutlet weak var aniView: UIView!
    var animationView :LottieAnimationView?
    let padding:CGFloat = 10
    let height :CGFloat = 300
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimation();
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.loadingIndicator.stopAnimating();
            self.animationView?.stop()
                   self.performSegue(withIdentifier: "toHome", sender: self)
               }
    }
    

    func setUpAnimation(){
        loadingIndicator.startAnimating()
        animationView = .init(name:"solar_ani")
        animationView?.frame = aniView.bounds
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.5
        animationView?.contentMode = .scaleAspectFit
          for subview in aniView.subviews {
              subview.removeFromSuperview()
          }
        aniView.addSubview(animationView!)
        animationView?.play()
    }

}
