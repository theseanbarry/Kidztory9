//
//  ViewController.swift
//  Kidztory 9
//
//  Created by Sean Barry on 2/11/2017.
//  Copyright © 2017 Sean Barry. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var openingAnimationOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playVOSound(99)
        var openingAnimationList = [UIImage]()
        for i in 0...3  {
            let imageName = "logo\(i)"
            if let image = UIImage(named: imageName) {
                openingAnimationList.append(image) } else {return}
        }
        self.openingAnimationOutlet.animationImages = openingAnimationList
        self.openingAnimationOutlet.animationDuration = 2
        self.openingAnimationOutlet.startAnimating()
        // let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(launchFunc), userInfo:nil, repeats: false)
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.performSegue(withIdentifier: "openingAnimationToTitleSegue", sender: self)
            playVOSound(0)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /* @objc func launchFunc() {
        self.performSegue(withIdentifier: "openingAnimationToTitleSegue", sender: self)
        playVOSound(0)
    } */
    
    @IBAction func readToMeButton(_ sender: Any) {
        readToMe = true
        performSegue(withIdentifier: "readToMeSegue", sender: nil)
    }
    @IBAction func myselfButton(_ sender: Any) {
        readToMe = false
        performSegue(withIdentifier: "readToMeSegue", sender: nil)
    }
    @IBAction func moreButton(_ sender: Any) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
