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
        guard voSound!.isPlaying == false else {return}
        playVOSound(1)
    }
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
                        playVOSound(0)
            }
        }
    }
    
    // page 02
    @IBAction func page02VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
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
        guard voSound!.isPlaying == false else {return}
        playVOSound(3)
    }
    @IBAction func page03GirlButton(_ sender: Any) {
        playSoundFX("02_Goldilocks_Wondering")
    }
    @IBAction func page03PaBowlButton(_ sender: Any) {
        playSoundFX("25_papa_Bowl")
    }
    @IBAction func page03MaBowlButton(_ sender: Any) {
        playSoundFX("26_mama_Bowl")
    }
    @IBAction func page03BabyBowlButton(_ sender: Any) {
        playSoundFX("27_baby_Bowl")
    }
    
    // page 04
    @IBAction func page04VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(4)
    }
    
    // page 05
    @IBAction func page05VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(5)
    }
    
    // page 06
    @IBAction func page06VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(6)
    }
    
    // page 07
    @IBAction func page07VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(7)
    }
    
    // page 08
    @IBAction func page08VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(8)
    }
    
    // page 09
    @IBAction func page09VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(9)
    }
    
    // page 10
    @IBAction func page10VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(10)
    }
    
    // page 11
    @IBAction func page11VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(11)
    }
    
    // page 12
    @IBAction func page12VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(12)
    }
    
    // page 13
    @IBAction func page13VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(13)
    }
    
    // page 14
    @IBAction func page14VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(14)
    }
    
    // page 15
    @IBAction func page15VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(15)
    }
    
    // page 16
    @IBAction func page16VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(16)
    }
    
    // page 17
    @IBAction func page17VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(17)
    }
    
    // page 18
    @IBAction func page18VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(18)
    }
    
    // page 19
    @IBAction func page19VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(19)
    }
    
    // page 20
    @IBAction func page20VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(20)
    }
    
    // page 21
    @IBAction func page21VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(21)
    }
    
    // page 22
    @IBAction func page22VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(22)
    }
    
    // page 23
    @IBAction func page23VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(23)
    }
    
    // page 24
    @IBAction func page24VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(24)
    }
    
    // page 25
    @IBAction func page25VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(25)
    }
    
    // page 26
    @IBAction func page26VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(26)
    }
    
    // page 27
    @IBAction func page27VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(27)
    }
    
    // page 28
    @IBAction func page28VO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(28)
    }
    
    // end
    @IBAction func endVO(_ sender: Any) {
        guard voSound!.isPlaying == false else {return}
        playVOSound(29)
    }
    
    // last
    
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
