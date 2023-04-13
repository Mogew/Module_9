//
//  ViewController.swift
//  Module_9
//
//  Created by Renat on 10.04.2023.
//

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    var correctAnswers = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
        
    }

    func updateUI() {
    
        
            self.falseButton.backgroundColor = .clear
            self.trueButton.backgroundColor = .clear
            self.questionLabel.text = self.quiz[self.questionNumber].questionText
            self.progressBar.progress += (1.0 / Float(self.quiz.count))

    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = (sender.titleLabel?.text)!
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            correctAnswers += 1
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        guard questionNumber < quiz.endIndex - 1
        else {
            questionNumber = 0
            var _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
                self.viewDidLoad()
            }
            return
        }
        questionNumber += 1
        var _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
            self.updateUI()
        }
    }
}

