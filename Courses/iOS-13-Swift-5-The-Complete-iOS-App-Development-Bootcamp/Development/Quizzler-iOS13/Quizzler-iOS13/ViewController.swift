//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    let quiz = [
        ("Four + Two equal to Six", true),
        ("Five - Three is greater than One", true),
        ("Three + Eight is less than Ten", false)
    ]

    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUi()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = Bool((sender.currentTitle?.lowercased())!)!
        let actualAnswer = quiz[questionNumber - 1].1
        print(userAnswer)
        print(actualAnswer)

        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        updateUi()
        print(sender)
    }
    
    func updateUi() {
        questionLabel.text = quiz[questionNumber].0
        
        if questionNumber + 1 < quiz.capacity {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
    }
    
}

