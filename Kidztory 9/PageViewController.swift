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
    @IBOutlet weak var titleEyesOutlet: UIImageView!
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        var titleList = [UIImage]()
        for _ in 0...40  {
            if let image = UIImage(named: "gtb_opening_eye03") {
                titleList.append(image)} else {return}
        } else {
                if let image = UIImage(named: "gtb_opening_eye01") {
                    titleList.append(image)} else {return}
            return
        }
        self.titleEyesOutlet.animationImages = titleList
        self.titleEyesOutlet.animationDuration = 6.3
        self.titleEyesOutlet.startAnimating()
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
