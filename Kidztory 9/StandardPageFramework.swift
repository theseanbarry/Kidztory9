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
        playSoundFX("SwapPage")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
            if beginning == true {
                pageCounter.number = 99
                playVOSound()
                pageCounter.resetNumber()
            } else {
                if readToMe == true {playVOSound()}
                else {return}
            }
        }
    }
}

// vo sound
var voSound: AVAudioPlayer?
func playVOSound() {
    guard readToMe == true else {return}
    guard (pageCounter.changed == false) && (voSound!.isPlaying == false) else {return}
    pageCounter.resetChanged()
    guard let url = Bundle.main.url(forResource: "\(pageCounter.number)", withExtension:"m4a", subdirectory:"EnglishVO") else {return}
    do {
        voSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
        guard let voSound = voSound else {return}
        voSound.play()
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
func blinkEyes(_ outlet:UIImageView?, open:String, half:String, closed:String) {
    guard let outlet = outlet else {return}
    var list = [UIImage]()
    for _ in 0..<200 {
        switch arc4random_uniform(10) {
        case 0..<9:
            for _ in 0..<10 {
                if let image = UIImage(named: open) {
                    list.append(image)} else {return}
            }
        default:
            if let image = UIImage(named: half) {
                list.append(image)} else {return}
            if let image = UIImage(named: closed) {
                list.append(image)} else {return}
            if let image = UIImage(named: half) {
                list.append(image)} else {return}
        }
    }
    outlet.animationImages = list
    outlet.animationDuration = 100
    outlet.startAnimating()
}

// stop motion single
func stopMotionSingle(_ outlet:UIImageView?, imageArray:[String], timeInterval:Double = 0.3) {
    guard let outlet = outlet else {return}
    let imageArrayCount = imageArray.count
    var list = [UIImage]()
    for i in imageArray {
        if let image = UIImage(named: i) {
            list.append(image)} else {return}
    }
    outlet.animationImages = list
    outlet.animationDuration = Double(imageArrayCount) * timeInterval
    outlet.animationRepeatCount = 1
    outlet.startAnimating()
}

// stop motion loop
func stopMotionLoop(_ outlet:UIImageView?, imageArray:[String], timeInterval:Double = 0.3) {
    guard let outlet = outlet else {return}
    let imageArrayCount = imageArray.count
    var list = [UIImage]()
    for i in imageArray {
        if let image = UIImage(named: i) {
            list.append(image)} else {return}
    }
    outlet.animationImages = list
    outlet.animationDuration = Double(imageArrayCount) * timeInterval
    outlet.startAnimating()
}

 // fluid movement(object, curve equation, duration)
