//
//  ViewController.swift
//  Kidztory 9
//
//  Created by Sean Barry on 2/11/2017.
//  Copyright © 2017 Sean Barry. All rights reserved.
//

import UIKit
import AVFoundation

class OpeningViewController: UIViewController {
    @IBOutlet weak var openingOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageCounter.number = 99
        playVOSound()
        pageCounter.resetNumber()
        var openingList = [UIImage]()
        for i in 0...3  {
            let imageName = "logo\(i)"
            if let image = UIImage(named: imageName) {
                openingList.append(image) } else {return}
        }
        self.openingOutlet.animationImages = openingList
        self.openingOutlet.animationDuration = 2.83
        self.openingOutlet.startAnimating()
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            self.performSegue(withIdentifier: "openingSegue", sender: self)
            playVOSound()
        }
    }
}
