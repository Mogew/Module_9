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
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    let quiz = [
        "Four + Two is equal Six",
        "Five - Three is greater than One",
        "Three + Five is less than Eleven"
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard questionNumber < quiz.endIndex - 1
        else {
            endOfQuiz()
            return
        }
        questionNumber += 1
        updateUI()
    }
    
    func updateUI () {
        questionField.text = quiz[questionNumber]
    }
    func endOfQuiz () {
        print("!")
        trueButton.isEnabled = false
        falseButton.isEnabled = false
    }
}

