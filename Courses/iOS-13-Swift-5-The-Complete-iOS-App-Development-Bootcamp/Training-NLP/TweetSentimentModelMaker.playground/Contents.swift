import Cocoa
import CreateML

let path = "/Users/serhii/Documents/Web/Training/Mobile/mobile/Courses/iOS-13-Swift-5-The-Complete-iOS-App-Development-Bootcamp/Training-NLP"
let url = URL(fileURLWithPath: "\(path)/twitter-sanders-apple3.csv")
let data = try MLDataTable(contentsOf: url)

let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Serhii On", shortDescription: "A model trained to classify sentiment on Tweets", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "\(path)/TweetSentimentClassifier.mlmodel"))


try sentimentClassifier.prediction(from: "@Apple is a terrible company!")

try sentimentClassifier.prediction(from: "I just found the best restaurant ever, and it's @DuckandWaffle")

try sentimentClassifier.prediction(from: "I think @CocaCola ads are just ok.")


