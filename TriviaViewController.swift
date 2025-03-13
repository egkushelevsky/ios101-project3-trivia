//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Elizabeth Kushelevsky on 3/13/25.
//

// Import the UIKit framework
// You're almost always going to need this when your referencing UI elements in your file
import UIKit


// Class declaration, including the name of the class and its subclass (UIViewController)
class TriviaViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var questionsStackView: UIStackView!
    
    
    enum TriviaQuestion : CaseIterable {
        case question1, question2, question3, question4
        
        var questionText: String {
            switch self {
            case .question1:
                return "What is the tenth letter of the alphabet?"
            case .question2:
                return "How many holes in a polo?"
            case .question3:
                return "Can a match box?"
            case .question4:
                return "What is the air-speed velocity of an unladen swallow?"
            }
        }
        
        var answerChoices: [String] {
            switch self {
            case .question1:
                return ["H", "J", "K", "L"]
            case .question2:
                return ["9", "7", "2", "4"]
            case .question3:
                return ["No, but a tin can", "Huh?", "Yes, one beat Mike Tyson", "No"]
            case .question4:
                return ["Roughly 20.1 miles per hour", "African or European?", "Blue", "That's a lot of coconuts"]
            }
        }
    }
    
    
    var currentQuestionIndex = 0
    // Function override for the view controller
    // This is fired when the view has finished loading for the first time
    override func viewDidLoad() {
        // Some functions require you to call the super class implementation
        // Always read the online documentation to know if you need to
        super.viewDidLoad()
        displayQuestion()
    }
    
    func displayQuestion() {
        let allQuestions = TriviaQuestion.allCases
        let currentQuestion = allQuestions[currentQuestionIndex]
        
        questionLabel.text = currentQuestion.questionText
        
        // Clear previous buttons before adding new ones
        questionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for answer in currentQuestion.answerChoices {
            let button = UIButton(type: .system)
            
            button.backgroundColor = UIColor.systemGray
            button.frame(forAlignmentRect: .infinite)
            button.setTitle(answer, for: .normal)

            button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
            questionsStackView.addArrangedSubview(button)
        }
    }
    
    @objc func answerTapped(_ sender: UIButton) {
        let allQuestions = TriviaQuestion.allCases
        currentQuestionIndex = (currentQuestionIndex + 1) % allQuestions.count // Cycle through questions
        displayQuestion()
    }
    
}
