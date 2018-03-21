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
// blink eyes
func blinkEyes(_ outlet:UIImageView!, open:String, half:String, closed:String) {
    var list = [UIImage]()
    for _ in 0..<100 {
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
    outlet.animationDuration = 50
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

