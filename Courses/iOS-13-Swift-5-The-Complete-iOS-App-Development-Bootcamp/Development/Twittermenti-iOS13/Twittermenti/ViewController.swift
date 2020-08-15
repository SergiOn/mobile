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
        
//        let prediction = try! sentimentClassifier.prediction(text: "@Apple is a terrible company!")
//        let prediction = try! sentimentClassifier.prediction(text: "@Apple is the best company!")
//        print(prediction.label)
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
//            print(results)
            
//            if let tweet = results[0]["full_text"].string {
//                print(tweet)
//            }
            
//            let tweets = results.array.map { (item) -> String in
//                return item["full_text"].string
//            }
            
            let tweets: [TweetSentimentClassifierInput] = results.array!
                .map({ (item) -> String in
                    return item["full_text"].string!
                })
                .map { (text) -> TweetSentimentClassifierInput in
                    return TweetSentimentClassifierInput(text: text)
                }
            
            do {
                let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
//                print(predictions)
                print(predictions[0].label)
                
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
                
            } catch {
                print("There was an error with making a prediction, \(error)")
            }
                        
        }) { (error) in
            print("There was an error with the Twitter API Request, \(error)")
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

