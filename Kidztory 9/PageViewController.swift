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
        playSoundFX("01_Goldilocks_Normal")
        // page01EyesConstraint.view removeConstraint:installed
        // stopMotionSingle(page01EyesOutlet, imageArray: [])
    }
    @IBAction func page01BugInvisibleButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
        insectBuzz(bugOutlet, open: #imageLiteral(resourceName: "gtb01_bug01"), closed: #imageLiteral(resourceName: "gtb01_bug02"))
    }
    
    // page 02
    @IBOutlet weak var page02GirlOutlet: UIImageView!
    @IBAction func page02GirlButton(_ sender: Any) {
        stopMotionFinite(page02GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb02_girlBack01"),#imageLiteral(resourceName: "gtb02_girlBack02")], count: 2)
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
    @IBOutlet weak var page04GirlOutlet: UIImageView!
    @IBOutlet weak var page04SmokeOutlet: UIImageView!
    
    @IBAction func page04GirlInvisibleButton(_ sender: Any) {
        playSoundFX("06b_Goldilocks_Ow")
    }
    @IBAction func page04BowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
    }
    
    // page 05
    @IBOutlet weak var page05GirlOutlet: UIImageView!
    
    @IBAction func page05GirlInvisibleButton(_ sender: Any) {
        playSoundFX("03_Goldilocks_Yuck")
    }
    @IBAction func page05BowlInvisibleButton(_ sender: Any) {
        playSoundFX("22b_Porridge")
    }
    
    // page 06
    @IBOutlet weak var page06GirlOutlet: UIImageView!
    
    @IBAction func page06GirlInvisibleButton(_ sender: Any) {
        playSoundFX("04_Goldilocks_Yummy")
    }
    @IBAction func page06BowlInvisibleButton(_ sender: Any) {
        playSoundFX("22_Porridge")
    }
    
    // page 07
    @IBOutlet weak var page07GirlOutlet: UIImageView!
    
    @IBAction func page07BigChairInvisibleButton(_ sender: Any) {
        playSoundFX("33_Big chair")
    }
    @IBAction func page07MediumChairInvisibleButton(_ sender: Any) {
        playSoundFX("34_Medium chair")
    }
    @IBAction func page07SmallChairInvisibleButton(_ sender: Any) {
        playSoundFX("35_Small chair")
    }
    @IBAction func page07GirlInvisibleButton(_ sender: Any) {
        playSoundFX("09_Goldilocks_humming")
    }
    
    // page 08
    @IBOutlet weak var page08GirlOutlet: UIImageView!
    
    @IBAction func page08GirlInvisibleButton(_ sender: Any) {
        playSoundFX("02_Goldilocks_Wondering")
    }
    
    // page 09
    @IBOutlet weak var page09EyesOutlet: UIImageView?
    @IBOutlet weak var page09FeetOutlet: UIImageView!
    
    @IBAction func page09GirlInvisibleButton(_ sender: Any) {
        playSoundFX("05_Goldilocks_disappointed")
    }
    
    // page 10
    @IBOutlet weak var page10BodyOutlet: UIImageView!
    @IBOutlet weak var page10EyesOutlet: UIImageView?
    @IBOutlet weak var page10FeetOutlet: UIImageView!
    
    @IBAction func page10GirlInvisibleButton(_ sender: Any) {
        playSoundFX("29_ChairBreaks_Goldilocks")
    }
    
    // page 11
    @IBOutlet weak var page11ScrollingBackgroundOutlet: UIView!
    
    @IBAction func page11GirlInvisibleButton(_ sender: Any) {
        playSoundFX("02_Goldilocks_Wondering")
    }
    @IBAction func page11BigBedInvisibleButton(_ sender: Any) {
        playSoundFX("30_Bed too hard")
    }
    @IBAction func page11MediumBedInvisibleButton(_ sender: Any) {
        playSoundFX("31_Bed too soft")
    }
    @IBAction func page11SmallBedInvisibleButton(_ sender: Any) {
        playSoundFX("32_Bed just right")
    }
    
    // page 12
    @IBOutlet weak var page12GirlOutlet: UIImageView!
    
    @IBAction func page12GirlInvisibleButton(_ sender: Any) {
        playSoundFX("06b_Goldilocks_Ow")
    }
    @IBAction func page12BigBedInvisibleButton(_ sender: Any) {
        playSoundFX("30_Bed too hard")
    }
    @IBAction func page12MediumBedInvisibleButton(_ sender: Any) {
        playSoundFX("31_Bed too soft")
    }
    @IBAction func page12SmallBedInvisibleButton(_ sender: Any) {
        playSoundFX("32_Bed just right")
    }
    
    // page 13
    @IBOutlet weak var page13BedOutlet: UIImageView!
    @IBOutlet weak var page13GirlOutlet: UIImageView!
    
    @IBAction func page13GirlInvisibleButton(_ sender: Any) {
        playSoundFX("05_Goldilocks_disappointed")
    }
    @IBAction func page13BigBedInvisibleButton(_ sender: Any) {
        playSoundFX("30_Bed too hard")
    }
    @IBAction func page13MediumBedInvisibleButton(_ sender: Any) {
        playSoundFX("31_Bed too soft")
    }
    @IBAction func page13SmallBedInvisibleButton(_ sender: Any) {
        playSoundFX("32_Bed just right")
    }
    
    // page 14
    @IBOutlet weak var page14GirlOutlet: UIImageView!
    @IBOutlet weak var page14LightOutlet: UIImageView!
    
    @IBAction func page14GirlInvisibleButton(_ sender: Any) {
        playSoundFX("07c_Goldilocks_sleeping")
    }
    @IBAction func page14LightInvisibleButton(_ sender: Any) {
        playSoundFX("28_Light_switch")
    }
    
    // page 15
    @IBOutlet weak var page15PaBowlOutlet: UIImageView!
    @IBOutlet weak var page15MaBowlOutlet: UIImageView!
    @IBOutlet weak var page15BabyBowlOutlet: UIImageView!
    @IBOutlet weak var page15BearsOutlet: UIImageView!
    @IBOutlet weak var page15PaEyesOutlet: UIImageView?
    @IBOutlet weak var page15MaEyesOutlet: UIImageView?
    @IBOutlet weak var page15BabyEyesOutlet: UIImageView?
    @IBAction func page15PaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("25_papa_Bowl")
    }
    @IBAction func page15MaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("26_mama_Bowl")
    }
    @IBAction func page15BabyBowlInvisibleButton(_ sender: Any) {
        playSoundFX("27_baby_Bowl")
    }
    @IBAction func page15BabyInvisibleButton(_ sender: Any) {
        playSoundFX("17_BabyBear_Normal")
        // random this and "17b_BabyBear_Normal2"
    }
    @IBAction func page15MaInvisibleButton(_ sender: Any) {
        playSoundFX("13_MamaBear_Normal")
    }
    @IBAction func page15PaInvisibleButton(_ sender: Any) {
        playSoundFX("10_PapaBear_Normal")
    }
    
    // page 16
    @IBOutlet weak var page16EyesOutlet: UIImageView?
    @IBOutlet weak var page16HandOutlet: UIImageView!
    
    @IBAction func page16PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
    }
    @IBAction func page16BowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
    }
    
    // page 17
    @IBOutlet weak var page17BabyHandOutlet: UIImageView!
    @IBOutlet weak var page17MaHandOutlet: UIImageView!
    @IBOutlet weak var page17PaHandOutlet: UIImageView!
    @IBOutlet weak var page17BabyEyesOutlet: UIImageView?
    @IBOutlet weak var page17MaEyesOutlet: UIImageView?
    @IBOutlet weak var page17PaEyesOutlet: UIImageView?
    
    @IBAction func page17BabyInvisibleButton(_ sender: Any) {
        playSoundFX("18_BabyBear_Sad")
    }
    @IBAction func page17MaInvisibleButton(_ sender: Any) {
        playSoundFX("14b_MamaBear_Scared")
    }
    @IBAction func page17PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
    }
    @IBAction func page17BabyBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22c_Porridge")
    }
    @IBAction func page17MaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22b_Porridge")
    }
    @IBAction func page17PaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
    }
    
    // page 18
    @IBOutlet weak var page18HandOutlet: UIImageView!
    @IBOutlet weak var page18EyesOutlet: UIImageView?
    
    @IBAction func page18BabyInvisibleButton(_ sender: Any) {
        playSoundFX("18_BabyBear_Sad")
    }
    @IBAction func page18BowlInvisibleButton(_ sender: Any) {
        playSoundFX("22c_Porridge")
    }
    
    // page 19
    @IBOutlet weak var page19BabyEyesOutlet: UIImageView?
    @IBOutlet weak var page19MaEyesOutlet: UIImageView?
    @IBOutlet weak var page19PaEyesOutlet: UIImageView?
    
    @IBAction func page19BabyInvisibleButton(_ sender: Any) {
        playSoundFX("17b_BabyBear_Normal2")
        // random this and "17_BabyBear_Normal"
    }
    @IBAction func page19MaInvisibleButton(_ sender: Any) {
        playSoundFX("13_MamaBear_Normal")
    }
    @IBAction func page19PaInvisibleButton(_ sender: Any) {
        playSoundFX("10_PapaBear_Normal")
    }
    @IBAction func page19BigChairInvisibleButton(_ sender: Any) {
        playSoundFX("33_Big chair")
    }
    @IBAction func page19MediumChairInvisibleButton(_ sender: Any) {
        playSoundFX("34_Medium chair")
    }
    
    // page 20
    @IBOutlet weak var page20HandOutlet: UIImageView!
    @IBOutlet weak var page20EyesOutlet: UIImageView?
    
    @IBAction func page20PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
    }
    @IBAction func page20ChairInvisibleButton(_ sender: Any) {
        playSoundFX("33_Big chair")
    }
    
    // page 21
    @IBOutlet weak var page21HandOutlet: UIImageView!
    @IBOutlet weak var page21EyesOutlet: UIImageView?
    
    @IBAction func page21MaInvisibleButton(_ sender: Any) {
        playSoundFX("15_MamaBear_shocked")
    }
    @IBAction func page21ChairInvisibleButton(_ sender: Any) {
        playSoundFX("34_Medium chair")
    }
    
    // page 22
    @IBOutlet weak var page22HandOutlet: UIImageView!
    @IBOutlet weak var page22TearOutlet: UIImageView!
    @IBOutlet weak var page22MaOutlet: UIImageView!
    @IBOutlet weak var page22PaOutlet: UIImageView!
    
    @IBAction func page22BabyInvisibleButton(_ sender: Any) {
        playSoundFX("19_BabyBear_Crying")
    }
    @IBAction func page22MaInvisibleButton(_ sender: Any) {
        playSoundFX("15_MamaBear_shocked")
    }
    @IBAction func page22PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
    }
    @IBAction func page22ChairInvisibleButton(_ sender: Any) {
        playSoundFX("35_Small chair")
    }
    
    // page 23
    @IBOutlet weak var page23MaOutlet: UIImageView!
    @IBOutlet weak var page23PaOutlet: UIImageView!
    
    @IBAction func page23BearsInvisibleButton(_ sender: Any) {
    }
    
    // page 24
    @IBOutlet weak var page24HandOutlet: UIImageView!
    @IBOutlet weak var page24EyesOutlet: UIImageView?
    
    @IBAction func page24PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
    }
    @IBAction func page24BedInvisibleButton(_ sender: Any) {
        playSoundFX("30_Bed too hard")
    }
    
    // page 25
    @IBOutlet weak var page25HandOutlet: UIImageView!
    @IBOutlet weak var page25EyesOutlet: UIImageView?
    
    @IBAction func page25MaInvisibleButton(_ sender: Any) {
        playSoundFX("14b_MamaBear_Scared")
    }
    @IBAction func page25BedInvisibleButton(_ sender: Any) {
        playSoundFX("31_Bed too soft")
    }
    
    // page 26
    @IBOutlet weak var page26HandOutlet: UIImageView!
    @IBOutlet weak var page26TearLOutlet: UIImageView!
    @IBOutlet weak var page26TearROutlet: UIImageView!
    @IBOutlet weak var page26GirlOutlet: UIImageView!
    @IBOutlet weak var page26LightOutlet: UIImageView!
    
    @IBAction func page26BabyInvisibleButton(_ sender: Any) {
        playSoundFX("20_BabyBear_sobbing")
    }
    @IBAction func page26GirlInvisibleButton(_ sender: Any) {
        playSoundFX("07_Goldilocks_sleeping")
    }
    @IBAction func page26LightInvisibleButton(_ sender: Any) {
        playSoundFX("28_Light_switch")
    }
    
    // page 27
    @IBOutlet weak var page27BackgroundOutlet: UIImageView!
    @IBOutlet weak var page27BearsOutlet: UIImageView!
    @IBOutlet weak var page27GirlJumpOutlet: UIImageView!
    @IBOutlet weak var page27DuvetOutlet: UIImageView!
    
    @IBAction func page27BabyInvisibleButton(_ sender: Any) {
        playSoundFX("21_BabyBear_Screaming")
    }
    @IBAction func page27MaInvisibleButton(_ sender: Any) {
        playSoundFX("16b_MamaBear_Screaming")
    }
    @IBAction func page27PaInvisibleButton(_ sender: Any) {
        playSoundFX("12_PapaBear_Screaming")
    }
    @IBAction func page27GirlJumpInvisibleButton(_ sender: Any) {
        playSoundFX("08a_Goldilocks_Scared")
    }
    @IBAction func page27GirlRunningInvisibleButton(_ sender: Any) {
        playSoundFX("08b_Goldilocks_running")
    }
    @IBAction func page27GirlPantingInvisibleButton(_ sender: Any) {
        playSoundFX("08c_Goldilocks_Panting")
    }
    
    // page 28 (remove bugoutlet)
    @IBOutlet weak var page28GirlOutlet: UIImageView!
    
    @IBAction func page28GirlInvisibleButton(_ sender: Any) {
        playSoundFX("01_Goldilocks_Normal")
    }
    @IBAction func page28BugInvisibleButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
    }
    
    // end
    @IBOutlet weak var endBowlOutlet: UIImageView!
    @IBAction func endBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22_Porridge")
    }
    
    // last
    @IBAction func againButton(_ sender: Any) {
    }
    @IBAction func tellAFriendButton(_ sender: Any) {
    }
    @IBAction func webButton(_ sender: Any) {
    }
    
    // all
    @IBOutlet weak var bugOutlet: UIImageView?
    
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
        
        // page 04
        
        // page 05
        
        // page 06
        
        // page 07
        
        // page 08
        
        // page 09
        blinkEyes(page09EyesOutlet, open: #imageLiteral(resourceName: "gtb09_eye01"), half: #imageLiteral(resourceName: "gtb09_eye02"), closed: #imageLiteral(resourceName: "gtb09_eye03"))
        
        // page 10
        blinkEyes(page10EyesOutlet, open: #imageLiteral(resourceName: "gtb10_eye01"), half: #imageLiteral(resourceName: "gtb10_eye02"), closed: #imageLiteral(resourceName: "gtb10_eye03"))
        
        // page 11
        
        // page 12
        
        // page 13
        
        // page 14
        
        // page 15
        blinkEyes(page15PaEyesOutlet, open: #imageLiteral(resourceName: "gtb15_papa01"), half: #imageLiteral(resourceName: "gtb15_papa02"), closed: #imageLiteral(resourceName: "gtb15_papa03"))
        blinkEyes(page15MaEyesOutlet, open: #imageLiteral(resourceName: "gtb15_mama01"), half: #imageLiteral(resourceName: "gtb15_mama02"), closed: #imageLiteral(resourceName: "gtb15_mama03"))
        blinkEyes(page15BabyEyesOutlet, open: #imageLiteral(resourceName: "gtb15_baby01"), half: #imageLiteral(resourceName: "gtb15_baby02"), closed: #imageLiteral(resourceName: "gtb15_baby03"))
        
        // page 16
        blinkEyes(page16EyesOutlet, open: #imageLiteral(resourceName: "gtb16_eye01"), half: #imageLiteral(resourceName: "gtb16_eye02"), closed: #imageLiteral(resourceName: "gtb16_eye03"))
        
        // page 17
        blinkEyes(page17BabyEyesOutlet, open: #imageLiteral(resourceName: "gtb17_babyEye01"), half: #imageLiteral(resourceName: "gtb17_babyEye02"), closed: #imageLiteral(resourceName: "gtb17_babyEye03"))
        blinkEyes(page17MaEyesOutlet, open: #imageLiteral(resourceName: "gtb17_mamaEye01"), half: #imageLiteral(resourceName: "gtb17_mamaEye02"), closed: #imageLiteral(resourceName: "gtb17_mamaEye03"))
        blinkEyes(page17PaEyesOutlet, open: #imageLiteral(resourceName: "gtb17_papaEye01"), half: #imageLiteral(resourceName: "gtb17_papaEye02"), closed: #imageLiteral(resourceName: "gtb17_papaEye03"))
        
        // page 18
        blinkEyes(page18EyesOutlet, open: #imageLiteral(resourceName: "gtb18_eye01"), half: #imageLiteral(resourceName: "gtb18_eye02"), closed: #imageLiteral(resourceName: "gtb18_eye03"))
        
        // page 19
        blinkEyes(page19BabyEyesOutlet, open: #imageLiteral(resourceName: "gtb19_baby01"), half: #imageLiteral(resourceName: "gtb19_baby02"), closed: #imageLiteral(resourceName: "gtb19_baby03"))
        blinkEyes(page19MaEyesOutlet, open: #imageLiteral(resourceName: "gtb19_mama01"), half: #imageLiteral(resourceName: "gtb19_mama02"), closed: #imageLiteral(resourceName: "gtb19_mama03"))
        blinkEyes(page19PaEyesOutlet, open: #imageLiteral(resourceName: "gtb19_papa01"), half: #imageLiteral(resourceName: "gtb19_papa02"), closed: #imageLiteral(resourceName: "gtb19_papa03"))
        
        // page 20
        blinkEyes(page20EyesOutlet, open: #imageLiteral(resourceName: "gtb20_eye01"), half: #imageLiteral(resourceName: "gtb20_eye02"), closed: #imageLiteral(resourceName: "gtb20_eye03"))
        
        // page 21
        blinkEyes(page21EyesOutlet, open: #imageLiteral(resourceName: "gtb21_eye01"), half: #imageLiteral(resourceName: "gtb21_eye02"), closed: #imageLiteral(resourceName: "gtb21_eye03"))
        
        // page 22
        
        // page 23
        
        // page 24
        blinkEyes(page24EyesOutlet, open: #imageLiteral(resourceName: "gtb24_eye01"), half: #imageLiteral(resourceName: "gtb24_eye02"), closed: #imageLiteral(resourceName: "gtb24_eye03"))
        
        // page 25
        blinkEyes(page25EyesOutlet, open: #imageLiteral(resourceName: "gtb25_eye01"), half: #imageLiteral(resourceName: "gtb25_eye02"), closed: #imageLiteral(resourceName: "gtb25_eye03"))
        
        // page 26
        
        // page 27
        
        // page 28
        
        // end
        
        // last
    }
}
