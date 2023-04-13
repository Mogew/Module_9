import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
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
        
        questionLabel.text = quizModel.getQuestionText()
        
        choice1.setTitle(quizModel.getButtonText(numberOfButton: 0), for: .normal)
        choice2.setTitle(quizModel.getButtonText(numberOfButton: 1), for: .normal)
        choice3.setTitle(quizModel.getButtonText(numberOfButton: 2), for: .normal)
        progressBar.progress  = quizModel.getProgress()

    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = (sender.titleLabel?.text)!
        // checkAnswer return color of button
        sender.backgroundColor = quizModel.checkAnswer(userAnswer)
        // we change questionNumber and check if it`s the last question
        guard quizModel.isNextQuestionAppear()
        else {
            popUpText.text = quizModel.getFinalScore()
            animateIn(desiredView: blurView)
            animateIn(desiredView: popUpView)
            return
        }
        
        var _ = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
            sender.backgroundColor = .clear
            self.updateUI()
        }
    }
    
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        quizModel.restart()
        updateUI()
        choice1.backgroundColor = .clear
        choice2.backgroundColor = .clear
        choice3.backgroundColor = .clear
        animateOut(desiredView: popUpView)
        animateOut(desiredView: blurView)
    }
    
    // animation
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
    
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
}

