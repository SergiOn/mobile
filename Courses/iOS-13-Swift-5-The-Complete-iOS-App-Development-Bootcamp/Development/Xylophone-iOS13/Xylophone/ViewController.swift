//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
//        let color = sender.backgroundColor
//        let colorAlpha = color?.withAlphaComponent(0.5)
//        sender.backgroundColor = colorAlpha

        let alpha = sender.alpha
        sender.alpha = 0.5

        UIView.animate(withDuration: 0.2/*1.0*/, animations: {
//            sender.backgroundColor = color
            sender.alpha = alpha
        })

//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
////            sender.alpha = alpha
//            sender.alpha = 1.0
//        }

        playSound(soundName: sender.currentTitle!)
    }

    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

