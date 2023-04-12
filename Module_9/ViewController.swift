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
    @IBOutlet weak var popUpView: UIView!
    
    let quiz = [
        "Four + Two is equal Six",
        "Five - Three is greater than One",
        "Three + Five is less than Eleven"
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.4)
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
        animateIn(desiredView: popUpView)
    }
    
    
    func animateIn (desiredView: UIView) {
        //add newView to the screen
        self.view.addSubview(desiredView)
        // set the view size to 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = self.view.center
        // animate effect (make it 100% size of view after 0.3 sec)
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
}

