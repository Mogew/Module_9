import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var popUpText: UILabel!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet weak var resetButton: UIButton!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.4)
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }

    func updateUI() {
        
        falseButton.backgroundColor = .clear
        trueButton.backgroundColor = .clear
        questionLabel.text = quizModel.getQuestionText()
        progressBar.progress  = quizModel.getProgress()

    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = (sender.titleLabel?.text)!
        // checkAnswer return color of button
        sender.backgroundColor = quizModel.checkAnswer(userAnswer)
        // we change questionNumber and check if it`s the last question
        guard quizModel.isNextQuestionAppear()
        else {
            popUpText.text = "Your score is \(quizModel.correctAnswers) / \(quizModel.quiz.count)"
            self.view.addSubview(blurView)
            self.view.addSubview(popUpView)
            return
        }
        
        var _ = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
            self.updateUI()
        }
    }
}

