import UIKit
struct QuizModel {
    let quiz = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
         
    var questionNumber = 0
    var correctAnswers = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> UIColor {
        if userAnswer == quiz[questionNumber].correctAnswer {
            correctAnswers += 1
            return .green
        } else {
            return .red
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].questionText
    }
    
    func getProgress() -> Float {
        let progress = (Float(questionNumber + 1) / Float(quiz.count))
        return progress
    }
    
    func getButtonText(numberOfButton: Int) -> String {
        return quiz[questionNumber].answer[numberOfButton]
    }
    
    mutating func isNextQuestionAppear() -> Bool {
        guard questionNumber < quiz.endIndex - 1
        else {
            return false
        }
        questionNumber += 1
        return true
    }
    
    mutating func restart() {
        questionNumber = 0
        correctAnswers = 0
    }
    
    func getFinalScore() -> String {
       return "Your score is \(correctAnswers) / \(quiz.count)"
    }
}
