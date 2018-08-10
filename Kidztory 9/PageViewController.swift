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
    
    // page 01
    @IBOutlet weak var page01GirlOutlet: UIImageView!
    @IBOutlet weak var page01EyesOutlet: UIImageView?
    @IBOutlet weak var page01EyesConstraint: NSLayoutConstraint!
    
    @IBAction func page01GirlInvisibleButton(_ sender: Any) {
        playSoundFX("01_Goldilocks_Normal")
        page01EyesOutlet?.isHidden = true
        stopMotionFinite(page01GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb01_girl04"), #imageLiteral(resourceName: "gtb01_girl05")], timeInterval: 0.5)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.92) {self.page01EyesOutlet?.isHidden = false}
    }
    @IBAction func page01BugInvisibleButton(_ sender: Any) {
        playSoundFX("23_Ladybird_flying")
        insectBuzz(bugOutlet, open: #imageLiteral(resourceName: "gtb01_bug01"), closed: #imageLiteral(resourceName: "gtb01_bug02"))
    }
    
    // page 02
    @IBOutlet weak var page02GirlOutlet: UIImageView!
    
    @IBAction func page02HouseButton(_ sender: Any) {
        if pageCounter.changed == true {
            stopMotionFinite(page02GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb02_girlBack02"),#imageLiteral(resourceName: "gtb02_girlBack01")], timeInterval: 0.18, count: 2)
            playSoundFX("24_Door_Knock")
        }
    }
    @IBAction func page02GirlButton(_ sender: Any) {
        stopMotionFinite(page02GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb02_girlBack01"),#imageLiteral(resourceName: "gtb02_girlBack02")], timeInterval: 0.18, count: 2)
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
    @IBOutlet weak var page04SmokeOutlet: UIImageView?
    
    @IBAction func page04GirlInvisibleButton(_ sender: Any) {
        playSoundFX("06b_Goldilocks_Ow")
        stopMotionFinite(page04GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb04_girl01"), #imageLiteral(resourceName: "gtb04_girl02"), #imageLiteral(resourceName: "gtb04_girl03"), #imageLiteral(resourceName: "gtb04_girl04"), #imageLiteral(resourceName: "gtb04_girl09")])
        // add blinking
    }
    @IBAction func page04BowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
        if pageCounter.changed == true {
            stopMotionFinite(page04GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb04_girl01"), #imageLiteral(resourceName: "gtb04_girl02"), #imageLiteral(resourceName: "gtb04_girl03"), #imageLiteral(resourceName: "gtb04_girl04"), #imageLiteral(resourceName: "gtb04_girl09")])
        }
    }
    
    // page 05
    @IBOutlet weak var page05GirlOutlet: UIImageView!
    
    @IBAction func page05GirlInvisibleButton(_ sender: Any) {
        playSoundFX("03_Goldilocks_Yuck")
        stopMotionFinite(page05GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb05_girl01"), #imageLiteral(resourceName: "gtb05_girl02"), #imageLiteral(resourceName: "gtb05_girl03"), #imageLiteral(resourceName: "gtb05_girl02")], count: 2)
    }
    @IBAction func page05BabyBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22c_Porridge")
    }
    @IBAction func page05MaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22b_Porridge")
    }
    @IBAction func page05PaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
    }
    
    // page 06
    @IBOutlet weak var page06GirlOutlet: UIImageView!
    
    @IBAction func page06GirlInvisibleButton(_ sender: Any) {
        if pageCounter.changed == true {
            playSoundFX("22_Porridge")
                    stopMotionFinite(page06GirlOutlet, imageArray: [ #imageLiteral(resourceName: "gtb06_girl02"), #imageLiteral(resourceName: "gtb06_girl03"), #imageLiteral(resourceName: "gtb06_girl04"), #imageLiteral(resourceName: "gtb06_girl05"), #imageLiteral(resourceName: "gtb06_girl06"), #imageLiteral(resourceName: "gtb06_girl07"), #imageLiteral(resourceName: "gtb06_girl08"), #imageLiteral(resourceName: "gtb06_girl09")], unloopable:true)
        } else {
            playSoundFX("04_Goldilocks_Yummy")
            stopMotionFinite(page06GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb06_girl12"), #imageLiteral(resourceName: "gtb06_girl13")], timeInterval: 0.5, count:2, unloopableFinished:true)
        }
    }
    @IBAction func page06BabyBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22_Porridge")
        stopMotionFinite(page06GirlOutlet, imageArray: [ #imageLiteral(resourceName: "gtb06_girl02"), #imageLiteral(resourceName: "gtb06_girl03"), #imageLiteral(resourceName: "gtb06_girl04"), #imageLiteral(resourceName: "gtb06_girl05"), #imageLiteral(resourceName: "gtb06_girl06"), #imageLiteral(resourceName: "gtb06_girl07"), #imageLiteral(resourceName: "gtb06_girl08"), #imageLiteral(resourceName: "gtb06_girl09")], unloopable:true)
    }
    @IBAction func page06MaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22b_Porridge")
    }
    @IBAction func page06PaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
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
        stopMotionFinite(page07GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb07_girl04"), #imageLiteral(resourceName: "gtb07_girl01")], timeInterval: 0.5)
    }
    
    // page 08
    @IBOutlet weak var page08GirlOutlet: UIImageView!
    
    @IBAction func page08GirlInvisibleButton(_ sender: Any) {
        playSoundFX("02_Goldilocks_Wondering")
        stopMotionFinite(page08GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb08_girl02"), #imageLiteral(resourceName: "gtb08_girl03"), #imageLiteral(resourceName: "gtb08_girl04"),#imageLiteral(resourceName: "gtb08_girl05")], unloopable: true)
    }
    
    // page 09
    @IBOutlet weak var page09EyesOutlet: UIImageView?
    @IBOutlet weak var page09FeetOutlet: UIImageView!
    
    @IBAction func page09GirlInvisibleButton(_ sender: Any) {
        playSoundFX("05_Goldilocks_disappointed")
        stopMotionFinite(page09FeetOutlet, imageArray: [#imageLiteral(resourceName: "gtb09_foot02"),#imageLiteral(resourceName: "gtb09_foot01")], timeInterval: 0.5, count: 4)
    }
    
    // page 10
    @IBOutlet weak var page10BodyOutlet: UIImageView!
    @IBOutlet weak var page10EyesOutlet: UIImageView?
    @IBOutlet weak var page10FeetOutlet: UIImageView!
    
    @IBAction func page10GirlInvisibleButton(_ sender: Any) {
        if pageCounter.changed == true {
            playSoundFX("29_ChairBreaks_Goldilocks")
            stopMotionFinite(page10BodyOutlet, imageArray: [#imageLiteral(resourceName: "gtb10_broke01"), #imageLiteral(resourceName: "gtb10_broke02"), #imageLiteral(resourceName: "gtb10_broke03")], unloopable:true)} else {
            playSoundFX("08a_Goldilocks_Scared")
        }
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
        stopMotionFinite(page12GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb12_girl03"), #imageLiteral(resourceName: "gtb12_girl02"), #imageLiteral(resourceName: "gtb12_girl01")], timeInterval: 0.4)
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
        stopMotionFinite(page13GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb13_girl02"), #imageLiteral(resourceName: "gtb13_girl03")], timeInterval: 1, unloopable: true)
        // check if this works cause of pageCounter.changed == false already, if not then change to unloopableFinished == true
        stopMotionFinite(page13BedOutlet, imageArray: [#imageLiteral(resourceName: "gtb13_bed02"), #imageLiteral(resourceName: "gtb13_bed03")], timeInterval: 1, unloopable: true)
    }
    @IBAction func page13BigBedInvisibleButton(_ sender: Any) {
        playSoundFX("30_Bed too hard")
    }
    @IBAction func page13MediumBedInvisibleButton(_ sender: Any) {
        if pageCounter.changed == true {
            playSoundFX("05_Goldilocks_disappointed")
            stopMotionFinite(page13GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb13_girl02"), #imageLiteral(resourceName: "gtb13_girl03")], timeInterval: 0.5, unloopable: true)
            // check if this works cause of pageCounter.changed == false already, if not then change to unloopableFinished == true
            stopMotionFinite(page13BedOutlet, imageArray: [#imageLiteral(resourceName: "gtb13_bed02"), #imageLiteral(resourceName: "gtb13_bed03")], timeInterval: 0.5, unloopable: true)
        } else {
        playSoundFX("31_Bed too soft")
        }
    }
    @IBAction func page13SmallBedInvisibleButton(_ sender: Any) {
        playSoundFX("32_Bed just right")
    }
    
    // page 14
    @IBOutlet weak var page14GirlOutlet: UIImageView!
    @IBOutlet weak var page14LightOutlet: UIImageView!
    
    @IBAction func page14GirlInvisibleButton(_ sender: Any) {
        stopMotionFinite(page14GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb14_girl02"), #imageLiteral(resourceName: "gtb14_girl03"), #imageLiteral(resourceName: "gtb14_girl04"), #imageLiteral(resourceName: "gtb14_girl05")], unloopable: true)
        playSoundFX("07c_Goldilocks_sleeping")
    }
    @IBAction func page14LightInvisibleButton(_ sender: Any) {
        page14LightOutlet.image = page14LightOutlet.image == #imageLiteral(resourceName: "gtb14_lightOff") ? #imageLiteral(resourceName: "gtb_blank") : #imageLiteral(resourceName: "gtb14_lightOff")
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
        stopMotionFinite(page15PaBowlOutlet, imageArray: [#imageLiteral(resourceName: "gtb15_paBowl02"), #imageLiteral(resourceName: "gtb15_paBowl03"), #imageLiteral(resourceName: "gtb15_paBowl04"), #imageLiteral(resourceName: "gtb15_paBowl01")], timeInterval: 0.2)
    }
    @IBAction func page15MaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("26_mama_Bowl")
        stopMotionFinite(page15MaBowlOutlet, imageArray: [#imageLiteral(resourceName: "gtb15_maBowl02"), #imageLiteral(resourceName: "gtb15_maBowl03"), #imageLiteral(resourceName: "gtb15_maBowl04"), #imageLiteral(resourceName: "gtb15_maBowl01")], timeInterval: 0.2)
    }
    @IBAction func page15BabyBowlInvisibleButton(_ sender: Any) {
        playSoundFX("27_baby_Bowl")
        stopMotionFinite(page15BabyBowlOutlet, imageArray: [#imageLiteral(resourceName: "gtb15_babyBowl02"), #imageLiteral(resourceName: "gtb15_babyBowl03"), #imageLiteral(resourceName: "gtb15_babyBowl04"), #imageLiteral(resourceName: "gtb15_babyBowl01")], timeInterval: 0.2)
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
        stopMotionFinite(page17BabyHandOutlet, imageArray: [#imageLiteral(resourceName: "gtb17_babyHand02"), #imageLiteral(resourceName: "gtb17_babyHand01")], count: 3)
    }
    @IBAction func page17MaInvisibleButton(_ sender: Any) {
        playSoundFX("14b_MamaBear_Scared")
        stopMotionFinite(page17MaHandOutlet, imageArray: [#imageLiteral(resourceName: "gtb17_mamaHand02"), #imageLiteral(resourceName: "gtb17_mamaHand01")], timeInterval: 0.5, count: 2)
    }
    @IBAction func page17PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
        stopMotionFinite(page17PaHandOutlet, imageArray: [#imageLiteral(resourceName: "gtb17_papaHand02"), #imageLiteral(resourceName: "gtb17_papaHand01")], timeInterval: 0.8, count: 2)
    }
    @IBAction func page17BabyBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22c_Porridge")
        stopMotionFinite(page17BabyHandOutlet, imageArray: [#imageLiteral(resourceName: "gtb17_babyHand02"), #imageLiteral(resourceName: "gtb17_babyHand01")], count: 3)
    }
    @IBAction func page17MaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22b_Porridge")
        stopMotionFinite(page17MaHandOutlet, imageArray: [#imageLiteral(resourceName: "gtb17_mamaHand02"), #imageLiteral(resourceName: "gtb17_mamaHand01")], timeInterval: 0.5, count: 2)
    }
    @IBAction func page17PaBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22a_Porridge")
        stopMotionFinite(page17PaHandOutlet, imageArray: [#imageLiteral(resourceName: "gtb17_papaHand02"), #imageLiteral(resourceName: "gtb17_papaHand01")], timeInterval: 0.8, count: 2)
    }
    
    // page 18
    @IBOutlet weak var page18HandOutlet: UIImageView!
    @IBOutlet weak var page18EyesOutlet: UIImageView?
    
    @IBAction func page18BabyInvisibleButton(_ sender: Any) {
        playSoundFX("18_BabyBear_Sad")
        stopMotionFinite(page18HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb18_hand02"), #imageLiteral(resourceName: "gtb18_hand01")], timeInterval: 1.5)
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
        stopMotionFinite(page20HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb20_hand02"), #imageLiteral(resourceName: "gtb20_hand01")], timeInterval: 1.5)
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
        stopMotionFinite(page22HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb22_babyHand02"), #imageLiteral(resourceName: "gtb22_babyHand01")], timeInterval: 0.3, count: 2)
        stopMotionFinite(page22TearOutlet, imageArray: [#imageLiteral(resourceName: "gtb_blank"), #imageLiteral(resourceName: "gtb22_drop01")], timeInterval: 0.75, unloopable:true)
    }
    @IBAction func page22MaInvisibleButton(_ sender: Any) {
        playSoundFX("15_MamaBear_shocked")
        stopMotionFinite(page22MaOutlet, imageArray: [#imageLiteral(resourceName: "gtb22_mama02"), #imageLiteral(resourceName: "gtb22_mama01")], timeInterval: 0.4, count: 3)
    }
    @IBAction func page22PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
        stopMotionFinite(page22PaOutlet, imageArray: [#imageLiteral(resourceName: "gtb22_papa02"), #imageLiteral(resourceName: "gtb22_papa01")], timeInterval: 0.7, count: 2)
    }
    @IBAction func page22ChairInvisibleButton(_ sender: Any) {
        playSoundFX("35_Small chair")
    }
    
    // page 23
    @IBOutlet weak var page23MaOutlet: UIImageView!
    @IBOutlet weak var page23PaOutlet: UIImageView!
    
    @IBAction func page23BearsInvisibleButton(_ sender: Any) {
        stopMotionFinite(page23MaOutlet, imageArray: [#imageLiteral(resourceName: "gtb23_mama02"), #imageLiteral(resourceName: "gtb23_mama03"), #imageLiteral(resourceName: "gtb23_mama04"), #imageLiteral(resourceName: "gtb23_mama05"), #imageLiteral(resourceName: "gtb23_mama06"), #imageLiteral(resourceName: "gtb23_mama07"), #imageLiteral(resourceName: "gtb23_mama08"), #imageLiteral(resourceName: "gtb23_mama09"), #imageLiteral(resourceName: "gtb23_mama10"), #imageLiteral(resourceName: "gtb23_mama11"), #imageLiteral(resourceName: "gtb23_mama12"), #imageLiteral(resourceName: "gtb23_mama13"), #imageLiteral(resourceName: "gtb23_mama14"), #imageLiteral(resourceName: "gtb23_mama15"), #imageLiteral(resourceName: "gtb23_mama16"), #imageLiteral(resourceName: "gtb23_mama17"), #imageLiteral(resourceName: "gtb23_mama18"), #imageLiteral(resourceName: "gtb23_mama19"), #imageLiteral(resourceName: "gtb23_mama20"), #imageLiteral(resourceName: "gtb_blank")], timeInterval: 0.25, unloopable:true)
        stopMotionFinite(page23PaOutlet, imageArray: [#imageLiteral(resourceName: "gtb23_papa02"), #imageLiteral(resourceName: "gtb23_papa03"), #imageLiteral(resourceName: "gtb23_papa04"), #imageLiteral(resourceName: "gtb23_papa05"), #imageLiteral(resourceName: "gtb23_papa06"), #imageLiteral(resourceName: "gtb23_papa07"), #imageLiteral(resourceName: "gtb23_papa08"), #imageLiteral(resourceName: "gtb_blank")], timeInterval: 0.65, unloopable:true)
    }
    
    // page 24
    @IBOutlet weak var page24HandOutlet: UIImageView!
    @IBOutlet weak var page24EyesOutlet: UIImageView?
    
    @IBAction func page24PaInvisibleButton(_ sender: Any) {
        playSoundFX("11_PapaBear_angry")
        stopMotionFinite(page24HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb24_hand02"), #imageLiteral(resourceName: "gtb24_hand01")], timeInterval: 0.6, count: 2)
    }
    @IBAction func page24BedInvisibleButton(_ sender: Any) {
        playSoundFX("30_Bed too hard")
    }
    
    // page 25
    @IBOutlet weak var page25HandOutlet: UIImageView!
    @IBOutlet weak var page25EyesOutlet: UIImageView?
    
    @IBAction func page25MaInvisibleButton(_ sender: Any) {
        playSoundFX("14b_MamaBear_Scared")
        stopMotionFinite(page25HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb25_hand02"), #imageLiteral(resourceName: "gtb25_hand01")], timeInterval: 0.4, count: 2)
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
        stopMotionFinite(page26HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb26_hand02"), #imageLiteral(resourceName: "gtb26_hand01")], timeInterval: 0.25, count: 3)
    }
    @IBAction func page26GirlInvisibleButton(_ sender: Any) {
        playSoundFX("07_Goldilocks_sleeping")
    }
    @IBAction func page26LightInvisibleButton(_ sender: Any) {
        page26LightOutlet.image = page26LightOutlet.image == #imageLiteral(resourceName: "gtb26_lightOff") ? #imageLiteral(resourceName: "gtb_blank") : #imageLiteral(resourceName: "gtb26_lightOff")
        playSoundFX("28_Light_switch")
    }
    
    // page 27
    @IBOutlet weak var page27BackgroundOutlet: UIImageView!
    @IBOutlet weak var page27BearsOutlet: UIImageView!
    @IBOutlet weak var page27GirlJumpOutlet: UIImageView!
    @IBOutlet weak var page27GirlPantingOutlet: UIImageView!
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
        stopMotionFinite(page27GirlJumpOutlet, imageArray: [#imageLiteral(resourceName: "gtb27_girlJump02"), #imageLiteral(resourceName: "gtb27_girlJump01")])
    }
    /* @IBAction func page27GirlPantingInvisibleButton(_ sender: Any) {
        playSoundFX("08c_Goldilocks_Panting")
        stopMotionFinite(page27GirlOutOutlet, imageArray: [#imageLiteral(resourceName: "gtb27_girlOut03"), #imageLiteral(resourceName: "gtb27_girlOut04")], count: 2, unloopableFinished: true)
    } */
    
    // page 28
    @IBOutlet weak var page28GirlOutlet: UIImageView!
    
    @IBAction func page28GirlInvisibleButton(_ sender: Any) {
        playSoundFX("01_Goldilocks_Normal")
        stopMotionFinite(page28GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb01_girl04"), #imageLiteral(resourceName: "gtb01_girl05")], timeInterval: 0.5)
        
    }
    @IBAction func page28BugInvisibleButton(_ sender: Any) {
        insectBuzz(bugOutlet, open: #imageLiteral(resourceName: "gtb28_bug01"), closed: #imageLiteral(resourceName: "gtb28_bug02"))
        playSoundFX("23_Ladybird_flying")
    }
    
    // end
    @IBOutlet weak var endBowlOutlet: UIImageView!
    @IBAction func endBowlInvisibleButton(_ sender: Any) {
        playSoundFX("22_Porridge")
        stopMotionFinite(endBowlOutlet, imageArray: [#imageLiteral(resourceName: "gtb_theEnd_food01"), #imageLiteral(resourceName: "gtb_theEnd_food02"), #imageLiteral(resourceName: "gtb_theEnd_food03"), #imageLiteral(resourceName: "gtb_theEnd_food04"), #imageLiteral(resourceName: "gtb_blank")], unloopable: true)
    }
    
    // last
    @IBAction func againButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToTitle", sender: self)
    }
    @IBAction func tellAFriendButton(_ sender: Any) {
    }
    @IBAction func webButton(_ sender: Any) {
    }
    
    // all
    @IBOutlet weak var bugOutlet: UIImageView?
    
    @IBAction func unwindToPreviousPage(unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func voButton(_ sender: Any) {
        playVOSound()
    }
    @IBAction func arrowLeftButton(_ sender: Any) {
        playPageFlipSounds(false)
        if pageCounter.number == 0 {
            performSegue(withIdentifier: "unwindSegueToTitle", sender: self)
        } else {
            performSegue(withIdentifier: "unwindSegueToPreviousPage", sender: self)
        }
    }
    @IBAction func arrowRightButton(_ sender: Any) {
        playPageFlipSounds(true)
        performSegue(withIdentifier: "nextPageSegue", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // all
            // button setup
        // var textButtonTest = UIButton()
        var arrowLeftButton = UIButton()
        var arrowRightButton = UIButton()
        
        /* textButtonTest = UIButton.init(type: .custom)
        textButtonTest.setTitle("Goldilocks then went to lorem ipsum.", for: UIControlState.normal)
        textButtonTest.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        textButtonTest.titleLabel?.numberOfLines = 0
        textButtonTest.backgroundColor = UIColor.green
        textButtonTest.addTarget(self, action: #selector(PageViewController.voButton), for: .touchUpInside)
        view.addSubview(textButtonTest) */
        
        arrowLeftButton = UIButton.init(type: .custom)
        arrowLeftButton.setImage(UIImage(named: "arrowleft"), for: UIControlState.normal)
        arrowLeftButton.addTarget(self, action: #selector(PageViewController.arrowLeftButton), for: .touchUpInside)
        view.addSubview(arrowLeftButton)
        
        arrowRightButton = UIButton.init(type: .custom)
        arrowRightButton.setImage(UIImage(named: "arrowright"), for: UIControlState.normal)
        arrowRightButton.addTarget(self, action: #selector(PageViewController.arrowRightButton), for: .touchUpInside)
        view.addSubview(arrowRightButton)
        
            // constraints
        // textButtonTest.translatesAutoresizingMaskIntoConstraints = false
        arrowLeftButton.translatesAutoresizingMaskIntoConstraints = false
        arrowRightButton.translatesAutoresizingMaskIntoConstraints = false
        
            /* NSLayoutConstraint(item: textButtonTest, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1.32, constant: 0).isActive = true
            NSLayoutConstraint(item: textButtonTest, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 0.75, constant: 0).isActive = true
        textButtonTest.widthAnchor.constraint(equalToConstant: 180).isActive = true
        textButtonTest.heightAnchor.constraint(equalToConstant: 50).isActive = true */
        
        arrowLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        arrowLeftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        arrowLeftButton.heightAnchor.constraint(equalTo: arrowLeftButton.widthAnchor, multiplier: 44/51).isActive = true
        if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            arrowLeftButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.105).isActive = true
            }
        
        arrowRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        arrowRightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        arrowRightButton.heightAnchor.constraint(equalTo: arrowRightButton.widthAnchor, multiplier: 44/51).isActive = true
        if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            arrowRightButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.105).isActive = true
        }
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        // page 01
        //while pageCounter.blinkTempStop == false {
        blinkEyes(page01EyesOutlet, open: #imageLiteral(resourceName: "gtb01_eye01"), half: #imageLiteral(resourceName: "gtb01_eye02"), closed: #imageLiteral(resourceName: "gtb01_eye03"))
        
        // page 02
        
        // page 03
        blinkEyes(page03GirlOutlet, open: #imageLiteral(resourceName: "gtb03_girl01"), half: #imageLiteral(resourceName: "gtb03_girl02"), closed: #imageLiteral(resourceName: "gtb03_girl03"))
        
        // page 04
        stopMotionLoop(page04SmokeOutlet, imageArray: [#imageLiteral(resourceName: "gtb04_smoke01"), #imageLiteral(resourceName: "gtb04_smoke02")], timeInterval: 0.5)
        
        // page 05
        
        // page 06
        while pageCounter.changed == false {blinkEyes(page06GirlOutlet, open: #imageLiteral(resourceName: "gtb06_girl09"), half: #imageLiteral(resourceName: "gtb06_girl10"), closed: #imageLiteral(resourceName: "gtb06_girl11"))}
        
        // page 07
        blinkEyes(page07GirlOutlet, open: #imageLiteral(resourceName: "gtb07_girl01"), half: #imageLiteral(resourceName: "gtb07_girl02"), closed: #imageLiteral(resourceName: "gtb07_girl03"))
        
        // page 08
        
        // page 09
        blinkEyes(page09EyesOutlet, open: #imageLiteral(resourceName: "gtb09_eye01"), half: #imageLiteral(resourceName: "gtb09_eye02"), closed: #imageLiteral(resourceName: "gtb09_eye03"))
        
        // page 10
        /* while pageCounter.pageIsNotAnimating == true {
            stopMotionLoop(page10FeetOutlet, imageArray: [#imageLiteral(resourceName: "gtb10_foot02"), #imageLiteral(resourceName: "gtb10_foot01")])
            blinkEyes(page10EyesOutlet, open: #imageLiteral(resourceName: "gtb10_eye01"), half: #imageLiteral(resourceName: "gtb10_eye02"), closed: #imageLiteral(resourceName: "gtb10_eye03"))
        } */
        while pageCounter.changed == false {blinkEyes(page10EyesOutlet, open: #imageLiteral(resourceName: "gtb10_brokeEye02"), half: #imageLiteral(resourceName: "gtb10_brokeEye03"), closed: #imageLiteral(resourceName: "gtb10_brokeEye04"))}
        
        // page 11
        
        // page 12
        
        // page 13
        while pageCounter.changed == false {blinkEyes(page13GirlOutlet, open: #imageLiteral(resourceName: "gtb13_girl03"), half: #imageLiteral(resourceName: "gtb13_girl04"), closed: #imageLiteral(resourceName: "gtb13_girl05"))}
        
        // page 14
        while pageCounter.changed == false {stopMotionLoop(page14GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb14_girl07"), #imageLiteral(resourceName: "gtb14_girl06")], timeInterval: 1.0)}
        
        // page 15
        blinkEyes(page15PaEyesOutlet, open: #imageLiteral(resourceName: "gtb15_papa01"), half: #imageLiteral(resourceName: "gtb15_papa02"), closed: #imageLiteral(resourceName: "gtb15_papa03"))
        blinkEyes(page15MaEyesOutlet, open: #imageLiteral(resourceName: "gtb15_mama01"), half: #imageLiteral(resourceName: "gtb15_mama02"), closed: #imageLiteral(resourceName: "gtb15_mama03"))
        blinkEyes(page15BabyEyesOutlet, open: #imageLiteral(resourceName: "gtb15_baby01"), half: #imageLiteral(resourceName: "gtb15_baby02"), closed: #imageLiteral(resourceName: "gtb15_baby03"))
        
        // page 16
        stopMotionLoop(page16HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb16_hand02"), #imageLiteral(resourceName: "gtb16_hand01")], timeInterval: 0.6)
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
        stopMotionLoop(page21HandOutlet, imageArray: [#imageLiteral(resourceName: "gtb21_hand02"), #imageLiteral(resourceName: "gtb21_hand01")], timeInterval: 0.4)
        
        // page 22
        
        // page 23
        
        // page 24
        blinkEyes(page24EyesOutlet, open: #imageLiteral(resourceName: "gtb24_eye01"), half: #imageLiteral(resourceName: "gtb24_eye02"), closed: #imageLiteral(resourceName: "gtb24_eye03"))
        
        // page 25
        blinkEyes(page25EyesOutlet, open: #imageLiteral(resourceName: "gtb25_eye01"), half: #imageLiteral(resourceName: "gtb25_eye02"), closed: #imageLiteral(resourceName: "gtb25_eye03"))
        
        // page 26
        stopMotionLoop(page26GirlOutlet, imageArray: [#imageLiteral(resourceName: "gtb26_girl02"), #imageLiteral(resourceName: "gtb26_girl01")], timeInterval: 3.0)
        stopMotionLoop(page26TearLOutlet, imageArray: [#imageLiteral(resourceName: "gtb26_dropL"), #imageLiteral(resourceName: "gtb_blank")], timeInterval: 0.6)
        stopMotionLoop(page26TearROutlet, imageArray: [#imageLiteral(resourceName: "gtb_blank"), #imageLiteral(resourceName: "gtb26_dropR")], timeInterval: 0.6)
        
        // page 27
        
        // page 28
        // while pageCounter.blinkTempStop == false {blinkEyes(page28GirlOutlet, open: #imageLiteral(resourceName: "gtb28_girl01"), half: #imageLiteral(resourceName: "gtb28_girl02"), closed: #imageLiteral(resourceName: "gtb28_girl03"))}
        
        // end
        
        // last
    }
}

