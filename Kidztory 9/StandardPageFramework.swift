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
import SpriteKit

var readToMe = true

// vo sound
var voSound: AVAudioPlayer?
func playVOSound(_ soundID:Int) {
    guard let url = Bundle.main.url(forResource: "\(soundID)", withExtension:"m4a", subdirectory:"EnglishVO") else {
        return
    }
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        voSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
        guard let voSound = voSound else {
            return
        }
        voSound.play()
    } catch let error {print(error.localizedDescription)}
}


// sound fx
var soundFX: AVAudioPlayer?
func playSoundFX(_ soundFXName:String) {
    guard let url = Bundle.main.url(forResource: "\(soundFXName)", withExtension:"wav", subdirectory:"SoundFX") else {
        return
    }
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        soundFX = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        guard let soundFX = soundFX else {
            return
        }
        soundFX.play()
    } catch let error {print(error.localizedDescription)}
}

// page flip
class PageFlipAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.2
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        // let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        containerView.addSubview(toVC!.view)
        toVC!.view.alpha = 0.0
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            let animation = CATransition()
            animation.startProgress = 0.0
            animation.endProgress = (Float(duration / 2))
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            animation.type = "pageCurl"
            animation.subtype = "fromRight"
            animation.isRemovedOnCompletion = false
            animation.fillMode = "extended"
        }, completion: { finished in
            let cancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!cancelled)
        })
    }
}

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PageFlipAnimator()
    }
}



/* page flip v2
 func flipSounds() {
 playSoundFX("ArrowVoice")
 DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
 playSoundFX("SwapPage")
 }
 
 class PageFlip : UIStoryboardSegue {
 override func perform() {
 self.source.navigationController?.pushViewController(self.destination, animated: true)
 var forward = true
 UIView.animate(withDuration: 1.0, animations: {
 let animation = CATransition()
 animation.duration = 1.2
 animation.startProgress = 0.0
 animation.endProgress = 0.6
 animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
 animation.type = "pageCurl"
 animation.subtype = (self.forward == true ? "fromRight" : "fromLeft")
 animation.isRemovedOnCompletion = false
 animation.fillMode = "extended"
 self.source.layer.add(animation, forKey: "pageFlipAnimation")
 self.source.addSubview(destination)
 })
 }
 } */

/* page flip v1
 
 class pageFlip : UIStoryboardSegue {
 override func perform() {
 self.source.navigationController?.pushViewController(self.destination, animated: true)
 var forward = true
 func flip() {
 playSoundFX("ArrowVoice")
 playSoundFX("SwapPage")
 UIView.animate(withDuration: 1.0, animations: {
 let animation = CATransition()
 animation.duration = 1.2
 animation.startProgress = 0.0
 animation.endProgress = 0.6
 animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
 animation.type = "pageCurl"
 animation.subtype = (self.forward == true ? "fromRight" : "fromLeft")
 animation.isRemovedOnCompletion = false
 animation.fillMode = "extended"
 self.source.layer.add(animation, forKey: "pageFlipAnimation")
 self.source.addSubview(destination)
 })
 }
 }
 } */

// text vo
// object sound fx(sound)
// blinking eyes(imageview, images)
    // class blinkingEyesImageView : UIImageView {}
func blinkingEyes(_ eyeImageView: UIImageView, open:String, closed:String) {
    let b = true
    while b == true {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            eyeImageView.image = UIImage(named: closed)
            usleep(15000)
            eyeImageView.image = UIImage(named: open)
        }
    }

    // timer
    /*
    class BlinkScene:SKScene {
        // Time of last update(currentTime:) call
        var lastUpdateTime = TimeInterval(0)
        // Seconds elapsed since last action
        var timeSinceLastAction = TimeInterval(0)
        // Seconds before performing next action. Choose a default value
        var timeUntilNextAction = TimeInterval(12)
     
        override func update(_ currentTime: TimeInterval) {
            let delta = currentTime - lastUpdateTime
            lastUpdateTime = currentTime
            timeSinceLastAction += delta
     
            if timeSinceLastAction >= timeUntilNextAction {
                // perform your action (blink)
                eyeImageView.image = UIImage(named: closedEyes.String)
                usleep(45000)
                eyeImageView.image = UIImage(named: openEyes.String)
                // reset
                timeSinceLastAction = TimeInterval(0)
                // Randomize seconds until next action
                timeUntilNextAction = CDouble(arc4random_uniform(12))
            }
        }
    }
 */
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

