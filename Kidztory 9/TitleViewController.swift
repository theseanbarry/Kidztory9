//
//  TitleViewController.swift
//  Kidztory 9
//
//  Created by Sean Barry on 13/5/2018.
//  Copyright © 2018 Sean Barry. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class TitleViewController: UIViewController {
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
    
    @IBAction func unwindToTitle(unwindSegue: UIStoryboardSegue) {
        readToMe = true
        playPageFlipSounds(true, beginning: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            guard pageCounter.number == 0 else {return}
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                guard pageCounter.number == 0 else {return}
                playVOSound()
            }
        }
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        blinkEyes(titleEyesOutlet, open: #imageLiteral(resourceName: "gtb_opening_eye01"), half: #imageLiteral(resourceName: "gtb_opening_eye02"), closed: #imageLiteral(resourceName: "gtb_opening_eye03"))
    }
}
