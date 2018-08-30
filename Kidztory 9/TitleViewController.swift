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
    @IBAction func readToMeButton(_ sender: Any) {
        readToMe = true
        playPageFlipSounds(true)
        performSegue(withIdentifier: "titleSegue", sender: self)
    }
    @IBAction func myselfButton(_ sender: Any) {
        readToMe = false
        playPageFlipSounds(true)
        voSound?.stop()
        performSegue(withIdentifier: "titleSegue", sender: self)
    }
    @IBAction func moreButton(_ sender: Any) {
        performSegue(withIdentifier: "moreSegue", sender: self)
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
    @IBAction func unwindToPreviousPage(unwindSegue: UIStoryboardSegue) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // outlet & button setup
        var titleEyesViewTest = UIImageView()
        var readToMeButtonTest = UIButton()
        var myselfButtonTest = UIButton()
        var moreButtonTest = UIButton()
        
        titleEyesViewTest = UIImageView.init(image: #imageLiteral(resourceName: "gtb_opening_eye01"))
        blinkEyes(titleEyesViewTest, open: #imageLiteral(resourceName: "gtb_opening_eye01"), half: #imageLiteral(resourceName: "gtb_opening_eye02"), closed: #imageLiteral(resourceName: "gtb_opening_eye03"))
        view.addSubview(titleEyesViewTest)
        
        readToMeButtonTest = UIButton.init(type: .custom)
        readToMeButtonTest.setImage(UIImage(named: "gtb_opening_readtome"), for: UIControlState.normal)
        readToMeButtonTest.addTarget(self, action: #selector(TitleViewController.readToMeButton), for: .touchUpInside)
        view.addSubview(readToMeButtonTest)
        
        myselfButtonTest = UIButton.init(type: .custom)
        myselfButtonTest.setImage(UIImage(named: "gtb_opening_myself"), for: UIControlState.normal)
        myselfButtonTest.addTarget(self, action: #selector(TitleViewController.myselfButton), for: .touchUpInside)
        view.addSubview(myselfButtonTest)
        
        moreButtonTest = UIButton.init(type: .custom)
        moreButtonTest.setImage(UIImage(named: "gtb_opening_more"), for: UIControlState.normal)
        moreButtonTest.addTarget(self, action: #selector(TitleViewController.moreButton), for: .touchUpInside)
        view.addSubview(moreButtonTest)
        
        // constraints
        subviewPosition(view, titleEyesViewTest, centerX: 0.795, centerY: -0.07)
        subviewPosition(view, readToMeButtonTest, centerX: 1.44, centerY: -0.15)
        subviewPosition(view, myselfButtonTest, centerX: 1.54, centerY: 0.16)
        subviewPosition(view, moreButtonTest, centerX: 1.48, centerY: 0.45)
        subviewSize(view, titleEyesViewTest, #imageLiteral(resourceName: "gtb_opening_eye01"))
        subviewSize(view, readToMeButtonTest, #imageLiteral(resourceName: "gtb_opening_readtome"))
        subviewSize(view, myselfButtonTest, #imageLiteral(resourceName: "gtb_opening_myself"))
        subviewSize(view, moreButtonTest, #imageLiteral(resourceName: "gtb_opening_more"))
    }
}
