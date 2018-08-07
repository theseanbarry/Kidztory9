//
//  MoreViewController.swift
//  Kidztory 9
//
//  Created by Sean Barry on 13/5/2018.
//  Copyright © 2018 Sean Barry. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MoreViewController: UIViewController {
    @IBAction func unwindToPreviousPage(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToPreviousPage", sender: self)
    }
}
