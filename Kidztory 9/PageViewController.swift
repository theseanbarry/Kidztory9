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
        func blinkTitleEyes() {
            var titleList = [UIImage]()
            for _ in 0..<100 {
                switch arc4random_uniform(10) {
                case 0..<9:
                    for _ in 0..<10 {
                        if let image = UIImage(named: "gtb_opening_eye01") {
                            titleList.append(image)} else {return}
                    }
                default:
                    if let image = UIImage(named: "gtb_opening_eye02") {
                    titleList.append(image)} else {return}
                    if let image = UIImage(named: "gtb_opening_eye03") {
                    titleList.append(image)} else {return}
                    if let image = UIImage(named: "gtb_opening_eye02") {
                    titleList.append(image)} else {return}
                }
            }
            self.titleEyesOutlet.animationImages = titleList
            print(titleList)
            self.titleEyesOutlet.animationDuration = 50
            self.titleEyesOutlet.startAnimating()
        }
        blinkTitleEyes()
        
        /*
        func blinkTitleEyes() {
            for _ in 0...7 {
                struct RandomNumberStruct {
                    var titleList = [UIImage]()
                    var randomNumber = arc4random_uniform(200) {
                        willSet {
                            for _ in 0...randomNumber {
                                if let image = UIImage(named: "gtb_opening_eye01") {
                                    titleList.append(image)} else {return}
                            }
                            if let image = UIImage(named: "gtb_opening_eye02") {
                                titleList.append(image)} else {return}
                            if let image = UIImage(named: "gtb_opening_eye03") {
                                titleList.append(image)} else {return}
                            if let image = UIImage(named: "gtb_opening_eye02") {
                                titleList.append(image)} else {return}
                            for _ in 0...(200 - randomNumber) {
                                if let image = UIImage(named: "gtb_opening_eye01") {
                                    titleList.append(image)} else {return}
                            }
                        }
                    }
                }
            let eyes = RandomNumberStruct()
            }
            self.titleEyesOutlet.animationImages = eyes.titleList
            self.titleEyesOutlet.animationDuration = 120
            self.titleEyesOutlet.startAnimating()
        } */
        
        // var titleList = [UIImage]()
        /* for _ in 0...400  {
            if let image = UIImage(named: "gtb_opening_eye01") {
                titleList.append(image)} else {return}
        }
        if let image = UIImage(named: "gtb_opening_eye02") {
            titleList.append(image)} else {return}
        if let image = UIImage(named: "gtb_opening_eye03") {
            titleList.append(image)} else {return}
        if let image = UIImage(named: "gtb_opening_eye02") {
            titleList.append(image)} else {return}
        for _ in 0...550  {
            if let image = UIImage(named: "gtb_opening_eye01") {
                titleList.append(image)} else {return}
        } */
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
