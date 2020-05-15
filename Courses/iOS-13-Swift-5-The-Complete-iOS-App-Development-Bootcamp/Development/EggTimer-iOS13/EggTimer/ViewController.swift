//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    let defaultSecondsRemaining = 60

    var timer: Timer?
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String = sender.currentTitle!
        let totalTime = eggTimes[hardness] ?? defaultSecondsRemaining
        var secondsPassed = 0

        progressBar.setProgress(0, animated: false)
        timer?.invalidate()
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsPassed < totalTime {
                secondsPassed += Int(Timer.timeInterval)

                let percentageProgress = Float(secondsPassed) / Float(totalTime)
                self.progressBar.setProgress(percentageProgress, animated: true)
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
                self.playSound()
            }
        }
    }

    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
