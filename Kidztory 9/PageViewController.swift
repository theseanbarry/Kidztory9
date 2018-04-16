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

class PageViewController: UIViewController {
    // title
    @IBOutlet weak var titleEyesOutlet: UIImageView?
    @IBAction func readToMeButton(_ sender: Any) {
        readToMe = true
        playPageFlipSounds(true)
    }
    @IBAction func myselfButton(_ sender: Any) {
        readToMe = false
        playPageFlipSounds(true)
        voSound?.stop()
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
    @IBAction func unwindToBeginning(unwindSegue: UIStoryboardSegue) {
        playPageFlipSounds(true, beginning: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            guard pageCounter.number == 0 else {return}
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                        guard pageCounter.number == 0 else {return}
                        playVOSound(0)
            }
        }
    }
    
    // page 02
    @IBAction func page02VO(_ sender: Any) {
        playVOSound(2)
    }
    @IBAction func page02GirlButton(_ sender: Any) {
        playSoundFX("24_Door_Knock")
    }
    @IBAction func page02BugButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
    }
    
    // page 03
    @IBAction func page03VO(_ sender: Any) {
        playVOSound(3)
    }
    
    // all
    @IBAction func unwindToPreviousPage(unwindSegue: UIStoryboardSegue) {}
    @IBAction func arrowLeftButton(_ sender: Any) {
        playPageFlipSounds(false)
    }
    @IBAction func arrowRightButton(_ sender: Any) {
        playPageFlipSounds(true)
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        // title
        blinkEyes(titleEyesOutlet, open: "gtb_opening_eye01", half: "gtb_opening_eye02", closed: "gtb_opening_eye03")
        // page 01
        blinkEyes(page01EyesOutlet, open: "gtb01_eye01", half: "gtb01_eye02", closed: "gtb01_eye03")
    }
    
}
