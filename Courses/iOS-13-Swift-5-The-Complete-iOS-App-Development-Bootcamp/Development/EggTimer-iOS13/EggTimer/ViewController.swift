//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    let defaultSecondsRemaining = 60

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String = sender.currentTitle!
        var secondsRemaining = eggTimes[hardness] ?? defaultSecondsRemaining

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            print(secondsRemaining)
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
            }
        }
    }
    
}
