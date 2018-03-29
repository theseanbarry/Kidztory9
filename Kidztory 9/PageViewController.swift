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
    // title
    @IBOutlet weak var titleEyesOutlet: UIImageView?
    @IBAction func readToMeButton(_ sender: Any) {
        readToMe = true
        performSegue(withIdentifier: "titleSegue", sender: nil)
        //page flip sound function
        playSoundFX("ArrowVoice")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.2) {
            playSoundFX("SwapPage")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
                playVOSound(1)
            }
        }
    }
    @IBAction func myselfButton(_ sender: Any) {
        readToMe = false
        performSegue(withIdentifier: "titleSegue", sender: nil)
    }
    @IBAction func moreButton(_ sender: Any) {
    }
    // page 01
    @IBOutlet weak var page01EyesOutlet: UIImageView?
    @IBAction func page01VO(_ sender: Any) {
        playVOSound(1)
    }
    @IBAction func page01GirlButton(_ sender: Any) {
        playSoundFX("09_Goldilocks_humming")
    }
    @IBAction func page01BugButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        // title
        blinkEyes(titleEyesOutlet, open: "gtb_opening_eye01", half: "gtb_opening_eye02", closed: "gtb_opening_eye03")
        // page 01
        blinkEyes(page01EyesOutlet, open: "gtb01_eye01", half: "gtb01_eye02", closed: "gtb01_eye03")
    }

    /*
    @IBOutlet weak var backgroundImageView: UIImageView! {
    }
    @IBAction func arrowLeftButton(_ sender: Any) {
       forward = true}
    
    @IBAction func arrowRightButton(_ sender: Any) {
        forward = false)
    } */
    
}
