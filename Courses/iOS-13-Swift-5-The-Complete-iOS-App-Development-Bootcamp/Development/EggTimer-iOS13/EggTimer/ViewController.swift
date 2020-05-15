//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    let defaultSecondsRemaining = 60
    var timer: Timer?

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String = sender.currentTitle!
        var secondsRemaining = eggTimes[hardness] ?? defaultSecondsRemaining

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            print(secondsRemaining)
            if secondsRemaining > 0 {
                secondsRemaining -= Int(Timer.timeInterval)
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
        }
    }
    
}
