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
    @IBAction func page01GirlButton(_ sender: Any) {
        playSoundFX("09_Goldilocks_humming")
    }
    @IBAction func page01BugButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
    }
    @IBAction func unwindToBeginning(unwindSegue: UIStoryboardSegue) {
        readToMe = true
        playPageFlipSounds(true, beginning: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            guard pageCounter.number == 0 else {return}
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                        guard pageCounter.number == 0 else {return}
                        playVOSound()
            }
        }
    }
    
    // page 02
    @IBAction func page02GirlButton(_ sender: Any) {
        playSoundFX("24_Door_Knock")
    }
    @IBAction func page02BugButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
    }
    
    // page 03
    @IBOutlet weak var page03PaBowlOutlet: UIImageView!
    @IBAction func page03GirlButton(_ sender: Any) {
        playSoundFX("02_Goldilocks_Wondering")
    }
    @IBAction func page03PaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("25_papa_Bowl")
        stopMotionSingle(page03PaBowlOutlet, imageArray: ["gtb03_paBowl01", "gtb03_paBowl02", "gtb03_paBowl03", "gtb03_paBowl04"], timeInterval: 0.3)
    }
    @IBAction func page03MaBowlButton(_ sender: Any) {
        playSoundFX("26_mama_Bowl")
    }
    @IBAction func page03BabyBowlButton(_ sender: Any) {
        playSoundFX("27_baby_Bowl")
    }
    
    // page 04

    // page 05

    // page 06

    // page 07

    // page 08

    // page 09

    // page 10

    // page 11

    // page 12

    // page 13

    // page 14

    // page 15

    // page 16

    // page 17
 
    // page 18
   
    // page 19

    // page 20

    // page 21

    // page 22

    // page 23

    // page 24
    
    // page 25
    
    // page 26
    
    // page 27
    
    // page 28
    
    // end
    
    // last
    
    // all
    @IBAction func unwindToPreviousPage(unwindSegue: UIStoryboardSegue) {}
    @IBAction func voButton(_ sender: Any) {
        playVOSound()
    }
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
        // page 02
        
        // page 03
        
    }
}
