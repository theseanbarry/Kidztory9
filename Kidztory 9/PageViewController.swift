//
//  PageViewController.swift
//  Kidztory 9
//
//  Created by Sean Barry on 11/1/2018.
//  Copyright © 2018 Sean Barry. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import SpriteKit

class PageViewController: UIViewController {
    @IBOutlet weak var titleEyesImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let b = true
        while b {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
                self.titleEyesImageView.image = UIImage(named: "gtb_opening_eye03")
                usleep(15000)
                self.titleEyesImageView.image = UIImage(named: "gtb_opening_eye01")
            }
        }
    }
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
    
    //blinkingEyes(titleEyesImageView, open: "gtb_opening_eye01", closed: "gtb_opening_eye03")
    
    
    /*
    @IBOutlet weak var backgroundImageView: UIImageView! {
    }
    @IBAction func arrowLeftButton(_ sender: Any) {
       forward = true}
    
    @IBAction func arrowRightButton(_ sender: Any) {
        forward = false)
    } */
    
    
    
}
