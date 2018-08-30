//
//  Page standard framework.swift
//  Kidztory 9
//
//  Created by Sean Barry on 22/12/2017.
//  Copyright © 2017 Sean Barry. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

var readToMe = true

//page flip sound function
struct PageCounter {
    var number = Int()
    var previousNumber = Int()
    var pageIsNotAnimating = Bool()
    var canBlink:Bool = true
    var changed = Bool()
    
    mutating func decrement() {previousNumber = number; number -= 1; pageIsNotAnimating = true; changed = true}
    mutating func increment() {previousNumber = number; number += 1; pageIsNotAnimating = true; changed = true}
    mutating func resetNumber() {previousNumber = number; number = 0; pageIsNotAnimating = true; changed = true}
    mutating func resetPageIsNotAnimating() {pageIsNotAnimating = true}
    mutating func resetChanged() {changed = false}
    mutating func blinkStop() {canBlink = false}
    mutating func blinkStart() {canBlink = true}
}

var pageCounter = PageCounter()
func playPageFlipSounds(_ right: Bool = true, beginning: Bool = false) {
    voSound?.stop()
    playSoundFX("ArrowVoice")
    right == true ? pageCounter.increment() : pageCounter.decrement()
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.2) {
        /* playSoundFX("SwapPage")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) */
        if beginning == true {
            pageCounter.number = 99
            playVOSound()
            pageCounter.resetNumber()
        } else if pageCounter.number == 30 {
            playVOSound()
        } else {
            if readToMe == true {playVOSound()}
            else {return}
        }
    }
}

// vo sound
var voSound: AVAudioPlayer?
// var voSoundPlaying = false
func playVOSound() {
    guard readToMe == true else {return}
/*    print(pageCounter.changed)
    print(voSoundPlaying)
    guard (pageCounter.changed == true) && (voSoundPlaying == false) else {return}
    pageCounter.resetChanged() */
    guard let url = Bundle.main.url(forResource: "\(pageCounter.number)", withExtension:"m4a", subdirectory:"EnglishVO") else {return}
    do {
        voSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
        guard let voSound = voSound else {return}
        voSound.play()
        // voSoundPlaying = true
    } catch let error {print(error.localizedDescription)}
}

// sound fx
var soundFX: AVAudioPlayer?
func playSoundFX(_ soundFXName:String) {
    guard let url = Bundle.main.url(forResource: "\(soundFXName)", withExtension:"wav", subdirectory:"SoundFX") else {return}
    do {
        soundFX = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        guard let soundFX = soundFX else {return}
        soundFX.play()
    } catch let error {print(error.localizedDescription)}
}

// blink eyes
func blinkEyes(_ outlet:UIImageView?, open:UIImage, half:UIImage, closed:UIImage) {
    guard let outlet = outlet else {return}
    var list = [UIImage]()
    for _ in 0..<200 {
        switch arc4random_uniform(10) {
        case 0..<9:
            for _ in 0..<10 {list.append(open)}
        default:
            list.append(half)
            list.append(closed)
            list.append(half)
        }
    }
    outlet.animationImages = list
    outlet.animationDuration = 100
    outlet.startAnimating()
}

// insect buzz
func insectBuzz(_ outlet:UIImageView?, open:UIImage, closed:UIImage) {
    guard let outlet = outlet else {return}
    var list = [UIImage]()
    for _ in 0..<3 {
        for _ in 0..<4 {list.append(closed); list.append(open)}
        for _ in 0..<14 {list.append(open)}
    }
    outlet.animationImages = list
    outlet.animationDuration = 6
    outlet.animationRepeatCount = 1
    outlet.startAnimating()
}

// stop motion finite
func stopMotionFinite(_ outlet:UIImageView?, imageArray:[UIImage], timeInterval:Double = 0.3, count:Int = 1, unloopable:Bool = false, unloopableFinished:Bool = false) {
    guard let outlet = outlet else {return}
    guard unloopableFinished == true || unloopable == false || pageCounter.changed == true else {return}
    pageCounter.blinkStop()
    let imageArrayCount = imageArray.count
    var list = [UIImage]()
    for i in imageArray {list.append(i)}
    outlet.animationImages = list
    outlet.animationDuration = Double(imageArrayCount) * timeInterval
    outlet.animationRepeatCount = count
    outlet.startAnimating()
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(imageArrayCount) * timeInterval - timeInterval) {
        pageCounter.blinkStart()
        if unloopable == true {
            outlet.image = list.last
            pageCounter.resetChanged()
        }
    }
}

// stop motion loop
func stopMotionLoop(_ outlet:UIImageView?, imageArray:[UIImage], timeInterval:Double = 0.3) {
    guard let outlet = outlet else {return}
    let imageArrayCount = imageArray.count
    var list = [UIImage]()
    for i in imageArray {list.append(i)}
    outlet.animationImages = list
    outlet.animationDuration = (Double(imageArrayCount) * timeInterval)
    outlet.startAnimating()
}

// subview constraints
enum subviewOrientationEnum {
    case topLeft, topCenter, topRight, centerLeft, centerRight, bottomLeft, bottomCenter, bottomRight
}
func subviewPositionOrtho(_ view: UIView, _ subview: UIView, _ orientation: subviewOrientationEnum) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    switch orientation {
        case .topLeft:
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
            subview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        case .topCenter:
            subview.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            subview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        case .topRight:
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
            subview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        case .centerLeft:
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
            subview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        case .centerRight:
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
            subview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        case .bottomLeft:
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
            subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        case .bottomCenter:
            subview.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        case .bottomRight:
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
            subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
}
func subviewPosition(_ view: UIView, _ subview: UIView, centerX: Double? = nil, centerY: Double? = nil, top: Int? = nil, leading: Int? = nil, trailing: Int? = nil, bottom: Int? = nil) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    if let centerX = centerX {
        NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(centerX), constant: 0).isActive = true
    }
    if let centerY = centerY {
        subview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: ((view.frame.width)*0.3217505571*CGFloat(centerY))).isActive = true
    }
    if let top = top {
        subview.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true
    }
    if let leading = leading {
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leading)).isActive = true
    }
    if let trailing = trailing {
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-trailing)).isActive = true
    }
    if let bottom = bottom {
        subview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(-bottom)).isActive = true
    }
}
func subviewSize(_ view: UIView, _ subview: UIView,_ image: UIImage) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    subview.heightAnchor.constraint(equalTo:subview.widthAnchor, multiplier: (image.size.height / image.size.width)).isActive = true
    if view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
        subview.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: (image.size.height)/CGFloat(834/0.84)).isActive = true
    } else {
        subview.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: (image.size.height)/CGFloat(834)).isActive = true
    }
}
func subviewAspect(_ subview: UIView, _ image: UIImage) {
    subview.heightAnchor.constraint(equalTo:subview.widthAnchor, multiplier: (image.size.height / image.size.width)).isActive = true
}

 // fluid movement(object, curve equation, duration)
