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

// vo sound
var voSound: AVAudioPlayer?
func playVOSound(_ soundID:Int) {
    guard readToMe == true else {return}
    guard let url = Bundle.main.url(forResource: "\(soundID)", withExtension:"m4a", subdirectory:"EnglishVO") else {return}
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

//page flip sound function
struct PageCounter {
    var number = Int()
    
    mutating func decrement() {number -= 1}
    mutating func increment() {number += 1}
    mutating func reset() {number = 0}
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
                playVOSound(pageCounter.number)
                pageCounter.reset()
            } else {
                if readToMe == true {playVOSound(pageCounter.number)}
                else {return}
            }
        }
    }
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

// stop motion back and forth movement(objects, custom translation?, custom rotation?, duration, custom iterations?)
/* func backAndForthMovement(duration: Double, x: Int, y: Int, rotation: Double) {
    var animating = false
    while animating == false {
        animating = true
        // forward animation
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.animatedUIView.center.x +=  x
            self.animatedUIView.center.y +=  y
            self.animatedUIView.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
        }, completion: nil)
        // reverse animation
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.animatedUIView.center.x -=  x
            self.animatedUIView.center.y -=  y
            self.animatedUIView.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
        }, completion: nil)
        animating = false
    }
}

// stop motion looping movement(objects, custom translation?, custom rotation?, duration)
// stop motion single movement(objects, custom translation?, custom rotation?)
func singleMovement(duration: Double, x: Int, y: Int, rotation: Double) {
    UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
        self.animatedUIView.center.x +=  x
        self.animatedUIView.center.y +=  y
        self.animatedUIView.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
    }, completion: nil)
}

 // fluid movement(object, curve equation, duration) */

