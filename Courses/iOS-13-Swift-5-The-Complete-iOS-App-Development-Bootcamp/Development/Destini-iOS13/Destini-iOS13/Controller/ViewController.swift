//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    let stories = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest.", choice1: "Open it.", choice2: "Check for traps.")
    ]

    var storyNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        storyLabel.text = stories[0].title
        choice1Button.setTitle(stories[0].choice1, for: .normal)
        choice2Button.setTitle(stories[0].choice2, for: .normal)
    }
    
    @IBAction func updateUI(_ sender: UIButton) {
        let userChoice = sender.currentTitle!

        //Find the current story based on the current value of storyNumber.
        let currentStory = stories[storyNumber]

        //If the user chose choice1 go to story 1 else go to story 2.
        if userChoice == currentStory.choice1 {
            storyNumber = 1
        } else if userChoice == currentStory.choice2 {
            storyNumber = 2
        }

        updateUI()
    }

    func updateUI() {
        storyLabel.text = stories[storyNumber].title
        choice1Button.setTitle(stories[storyNumber].choice1, for: .normal)
        choice2Button.setTitle(stories[storyNumber].choice2, for: .normal)
    }

}

