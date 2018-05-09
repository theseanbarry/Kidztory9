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
    @IBOutlet weak var page01GirlOutlet: UIImageView!
    @IBOutlet weak var page01EyesOutlet: UIImageView?
    @IBOutlet weak var page01EyesConstraint: NSLayoutConstraint!
    
    @IBAction func page01GirlInvisibleButton(_ sender: Any) {
        playSoundFX("09_Goldilocks_humming")
        // page01EyesConstraint.view removeConstraint:installed
        // stopMotionSingle(page01EyesOutlet, imageArray: [])
    }
    @IBAction func page01BugInvisibleButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
        insectBuzz(bugOutlet, open: #imageLiteral(resourceName: "gtb01_bug01"), closed: #imageLiteral(resourceName: "gtb01_bug02"))
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
    @IBAction func page02BugInvisibleButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
        insectBuzz(bugOutlet, open: #imageLiteral(resourceName: "gtb01_bug01"), closed: #imageLiteral(resourceName: "gtb01_bug02"))
    }
    
    // page 03
    @IBOutlet weak var page03GirlOutlet: UIImageView!
    @IBOutlet weak var page03PaBowlOutlet: UIImageView!
    @IBOutlet weak var page03MaBowlOutlet: UIImageView!
    @IBOutlet weak var page03BabyBowlOutlet: UIImageView!
    
    @IBAction func page03GirlInvisibleButton(_ sender: Any) {
        stopMotionFinite(page03GirlOutlet, imageArray: [ #imageLiteral(resourceName: "gtb03_girl04"), #imageLiteral(resourceName: "gtb03_girl01")], timeInterval: 1)
        playSoundFX("02_Goldilocks_Wondering")
    }
    @IBAction func page03PaBowlInvisibleButton(_ sender: Any) {
        stopMotionFinite(page03PaBowlOutlet, imageArray: [ #imageLiteral(resourceName: "gtb03_paBowl02"), #imageLiteral(resourceName: "gtb03_paBowl03"), #imageLiteral(resourceName: "gtb03_paBowl04"), #imageLiteral(resourceName: "gtb03_paBowl01")], timeInterval: 0.2)
        playSoundFX("25_papa_Bowl")
    }
    @IBAction func page03MaBowlInvisibleButton(_ sender: Any) {
        stopMotionFinite(page03MaBowlOutlet, imageArray: [ #imageLiteral(resourceName: "gtb03_maBowl02"), #imageLiteral(resourceName: "gtb03_maBowl03"), #imageLiteral(resourceName: "gtb03_maBowl04"), #imageLiteral(resourceName: "gtb03_maBowl01")], timeInterval: 0.2)
        playSoundFX("26_mama_Bowl")
    }
    @IBAction func page03BabyBowlInvisibleButton(_ sender: Any) {
        stopMotionFinite(page03BabyBowlOutlet, imageArray: [ #imageLiteral(resourceName: "gtb03_babyBowl02"), #imageLiteral(resourceName: "gtb03_babyBowl03"), #imageLiteral(resourceName: "gtb03_babyBowl04"), #imageLiteral(resourceName: "gtb03_babyBowl01")], timeInterval: 0.2)
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
    @IBOutlet weak var bugOutlet: UIImageView?
    
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
        blinkEyes(titleEyesOutlet, open: #imageLiteral(resourceName: "gtb_opening_eye01"), half: #imageLiteral(resourceName: "gtb_opening_eye02"), closed: #imageLiteral(resourceName: "gtb_opening_eye03"))
        // page 01
        blinkEyes(page01EyesOutlet, open: #imageLiteral(resourceName: "gtb01_eye01"), half: #imageLiteral(resourceName: "gtb01_eye02"), closed: #imageLiteral(resourceName: "gtb01_eye03"))
        // page 02
        
        // page 03
        blinkEyes(page03GirlOutlet, open: #imageLiteral(resourceName: "gtb03_girl01"), half: #imageLiteral(resourceName: "gtb03_girl02"), closed: #imageLiteral(resourceName: "gtb03_girl03"))
    }
}
