import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
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
        
        quizModel.nextQuestion()
        
        var _ = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
            self.updateUI()
        }
    }
}

