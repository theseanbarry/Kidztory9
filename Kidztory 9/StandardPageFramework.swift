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
    var changed = Bool()
    
    mutating func decrement() {number -= 1; changed = true}
    mutating func increment() {number += 1; changed = true}
    mutating func resetNumber() {number = 0; changed = true}
    mutating func resetChanged() {changed = false}
}

var pageCounter = PageCounter()
func playPageFlipSounds(_ right: Bool = true, beginning: Bool = false) {
    right == true ? pageCounter.increment() : pageCounter.decrement()
    voSound?.stop()
    playSoundFX("ArrowVoice")
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
    guard (pageCounter.changed == true) && (voSoundPlaying == false) else {return} */
    pageCounter.resetChanged()
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
func stopMotionFinite(_ outlet:UIImageView?, imageArray:[UIImage], timeInterval:Double = 0.3, count:Int = 1) {
    guard let outlet = outlet else {return}
    let imageArrayCount = imageArray.count
    var list = [UIImage]()
    for i in imageArray {list.append(i)}
    outlet.animationImages = list
    outlet.animationDuration = Double(imageArrayCount) * timeInterval
    outlet.animationRepeatCount = count
    outlet.startAnimating()
}

// stop motion loop
func stopMotionLoop(_ outlet:UIImageView?, imageArray:[UIImage], timeInterval:Double = 0.3) {
    guard let outlet = outlet else {return}
    let imageArrayCount = imageArray.count
    var list = [UIImage]()
    for i in imageArray {list.append(i)}
    outlet.animationImages = list
    outlet.animationDuration = Double(imageArrayCount) * timeInterval
    outlet.startAnimating()
}

 // fluid movement(object, curve equation, duration)
