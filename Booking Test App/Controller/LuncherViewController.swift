//
//  ViewController.swift
//  Booking Test App
//
//  Created by Geek on 14/06/2021.
//

import UIKit
import Lottie

class LuncherViewController: UIViewController {

    @IBOutlet weak var animatiionView: AnimationView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 1. Set animation content mode
          animationView.contentMode = .scaleAspectFit
          // 2. Set animation loop mode
          animationView.loopMode = .loop
          // 3. Adjust animation speed
          animationView.animationSpeed = 0.5
          // 4. Play animation
          animationView.play()
        
    }


}

