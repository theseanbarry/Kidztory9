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
        titleEyesViewTest.translatesAutoresizingMaskIntoConstraints = false
        readToMeButtonTest.translatesAutoresizingMaskIntoConstraints = false
        myselfButtonTest.translatesAutoresizingMaskIntoConstraints = false
        moreButtonTest.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: titleEyesViewTest, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 0.795, constant: 0).isActive = true
        titleEyesViewTest.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-(view.frame.width)*0.3217505571*0.07)).isActive = true
        titleEyesViewTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        titleEyesViewTest.heightAnchor.constraint(equalTo: titleEyesViewTest.widthAnchor, multiplier: 50/71).isActive = true
        
        NSLayoutConstraint(item: readToMeButtonTest, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1.44, constant: 0).isActive = true
        readToMeButtonTest.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-(view.frame.width)*0.3217505571*0.15)).isActive = true
        readToMeButtonTest.heightAnchor.constraint(equalTo: readToMeButtonTest.widthAnchor, multiplier: 2/7).isActive = true

        NSLayoutConstraint(item: myselfButtonTest, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1.54, constant: 0).isActive = true
        myselfButtonTest.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: ((view.frame.width)*0.3217505571*0.16)).isActive = true
        myselfButtonTest.heightAnchor.constraint(equalTo: myselfButtonTest.widthAnchor, multiplier: 95/427).isActive = true

        NSLayoutConstraint(item: moreButtonTest, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1.48, constant: 0).isActive = true
        moreButtonTest.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: ((view.frame.width)*0.3217505571*0.45)).isActive = true
        moreButtonTest.heightAnchor.constraint(equalTo: moreButtonTest.widthAnchor, multiplier: 113/365).isActive = true
        
        if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            readToMeButtonTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.0887).isActive = true
            myselfButtonTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.0887).isActive = true
            moreButtonTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1034).isActive = true
        } else {
            readToMeButtonTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1386).isActive = true
            myselfButtonTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1386).isActive = true
            moreButtonTest.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1654).isActive = true
        }
    }
}
