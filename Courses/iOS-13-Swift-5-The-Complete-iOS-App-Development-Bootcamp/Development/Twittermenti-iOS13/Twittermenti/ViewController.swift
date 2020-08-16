//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import Swifter
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let sentimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: "rsalS0xap2oUiRlQHweL2cZv8", consumerSecret: "FbdEbYKXVoxtuQhGDWo2kV7l2XBbLxFuFcXhZFfv4vvBSpGnKk")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func predictPressed(_ sender: Any) {
    
        if let searchText = textField.text {
            
            swifter.searchTweet(using: searchText, lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
                
                let tweets: [TweetSentimentClassifierInput] = results.array!
                    .map { (item) -> String in
                        return item["full_text"].string!
                    }
                    .map { (text) -> TweetSentimentClassifierInput in
                        return TweetSentimentClassifierInput(text: text)
                    }
                
                do {
                    let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                    var sentimentScore = 0
                    
                    for pred in predictions {
                        let sentiment = pred.label
                        
                        if sentiment == "Pos" {
                            sentimentScore += 1
                        } else if sentiment == "Neg" {
                            sentimentScore -= 1
                        }
                    }
                    print(sentimentScore)
                    
                    if sentimentScore > 20 {
                        self.sentimentLabel.text = "😍"
                    } else if sentimentScore > 10 {
                        self.sentimentLabel.text = "😀"
                    } else if sentimentScore > 0 {
                        self.sentimentLabel.text = "🙂"
                    } else if sentimentScore == 0 {
                        self.sentimentLabel.text = "😐"
                    } else if sentimentScore > -10 {
                        self.sentimentLabel.text = "😕"
                    } else if sentimentScore > -20 {
                        self.sentimentLabel.text = "😡"
                    } else {
                        self.sentimentLabel.text = "🤮"
                    }
                
                } catch {
                    print("There was an error with making a prediction, \(error)")
                }
            }) { (error) in
                print("There was an error with the Twitter API Request, \(error)")
            }
        }
    }
    
}

