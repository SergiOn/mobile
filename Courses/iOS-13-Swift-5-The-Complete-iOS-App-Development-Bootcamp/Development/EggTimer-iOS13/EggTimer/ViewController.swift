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
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    let defaultSecondsRemaining = 60
    var timer: Timer?

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String = sender.currentTitle!
        let totalTime = eggTimes[hardness] ?? defaultSecondsRemaining
        var secondsPassed = 0

//        progressBar.setProgress(1.0, animated: false)

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            print(totalTime)
            print(secondsPassed)

            if secondsPassed < totalTime {
                secondsPassed += Int(Timer.timeInterval)
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
            let percentageProgress = secondsPassed / totalTime
            print(Float(percentageProgress))
        }
    }
    
}
