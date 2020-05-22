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

    let quizBrain = QuizBrain()
    

    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUi()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        quizBrain.checkAnswer(userAnswer)


        let actualAnswer = quiz[questionNumber].a
        print(userAnswer)
        print(actualAnswer)

        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            print("Right!")
        } else {
            sender.backgroundColor = UIColor.red
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.capacity {
            questionNumber += 1
        } else {
            questionNumber = 0
        }

        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            self.updateUi()
        }
    }
    
    func updateUi() {
        questionLabel.text = quiz[questionNumber].q
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
    
}

