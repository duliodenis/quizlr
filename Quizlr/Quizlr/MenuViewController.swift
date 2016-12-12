//
//  MenuViewController.swift
//  Quizlr
//
//  Created by Dulio Denis on 12/3/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    // private constant that contains all View elements
    private let contentView = UIView()
    // private constant for the logo of the quiz game
    private let logoView = UIImageView()
    // private constant to hold the grid of four buttons
    private let buttonView = UIView()
    // private array variable containing the rounded buttons
    private var gameButtons = [RoundedButton]()
    // private constant to hold the score view
    private let scoreView = UIView()
    
    // private constants to hold the title, recent score, and high score labels
    private let titleLabel = UILabel()
    private let recentScoreLabel = UILabel()
    private let highScoreLabel = UILabel()
    
    // private array of the types of quiz games
    private let titles = [
        "Multiple Choice",
        "Image Quiz",
        "Right or Wrong",
        "Emoji Riddle"
    ]
    
    // private integer array for recent scores and high scores
    private var recentScores = [Int]()
    private var highScores = [Int]()
    
    // private int to keep track of the score
    private var scoreIndex = 0
    
    // private instance of time
    private var timer = Timer()
    
    // private variables for horizontal constraints - explicitly unwrapped
    private var midXConstraints: [NSLayoutConstraint]!
    private var leftConstraints: [NSLayoutConstraint]!
    private var rightConstraint: [NSLayoutConstraint]!
    
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the nav bar to black with white text
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.white
        // set the background color
        view.backgroundColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0)
        // layout the view
        layoutView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // hide the navigation bar
        navigationController?.navigationBar.isHidden = true
        updateScore()
    }
    
    
    // MARK: - Update Game Score
    
    func updateScore() {
        // fill the recent Score array with values in the user default
        recentScores = [
            UserDefaults.standard.integer(forKey: multipleChoiceRecentScoreIdentifier),
            UserDefaults.standard.integer(forKey: imageQuizRecentScoreIdentifier),
            UserDefaults.standard.integer(forKey: rightWrongRecentScoreIdentifier),
            UserDefaults.standard.integer(forKey: emojiRecentScoreIdentifier)
        ]
        
        highScores = [
            UserDefaults.standard.integer(forKey: multipleChoiceHighScoreIdentifier),
            UserDefaults.standard.integer(forKey: imageQuizHighScoreIdentifier),
            UserDefaults.standard.integer(forKey: rightWrongHighScoreIdentifier),
            UserDefaults.standard.integer(forKey: emojiHighScoreIdentifier)
        ]
    }
    
    
    // MARK: - Method to define autolayout constraints and position all controls in the view
    
    func layoutView() {
        // turn off auto resizing since we'll be handling that
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // add contentView to the screen
        view.addSubview(contentView)
        
        // add the logo view
        // turn off its auto resizing
        logoView.translatesAutoresizingMaskIntoConstraints = false
        // add the logo to the contentView
        contentView.addSubview(logoView)
        // add the image to the logoView
        logoView.image = UIImage(named: "quizlr")
        
        // add the four buttons to the contentView
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonView)
        
        // iterate through the titles enumeration
        for (index, title) in titles.enumerated() {
            // define a new instance of a RoundedButton button
            let button = RoundedButton()
            // turn off its autoresizing
            button.translatesAutoresizingMaskIntoConstraints = false
            // add to the buttonView
            buttonView.addSubview(button)
            // set various properties such as background color, font, and title
            button.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitle(title, for: .normal)
            // set the button's tag to be the index
            button.tag = index
            // set the target to be the buttonHandler
            button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
            gameButtons.append(button)
        }
        
        // add the score view to the contentView
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(scoreView)
        
        // add the title, recent score, and high score labels to the contentView
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        recentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scoreView.addSubview(titleLabel)
        scoreView.addSubview(recentScoreLabel)
        scoreView.addSubview(highScoreLabel)
        
        // set the label properties
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = UIColor.white
        
        recentScoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        recentScoreLabel.textColor = UIColor.white
        
        highScoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        highScoreLabel.textColor = UIColor.white
        
        // Set some preliminary values
        titleLabel.text = titles[scoreIndex]
        recentScoreLabel.text = "Recent: " + String(UserDefaults.standard.integer(forKey: multipleChoiceRecentScoreIdentifier))
        highScoreLabel.text = "Highscore: " + String(UserDefaults.standard.integer(forKey: multipleChoiceHighScoreIdentifier))
        
        // Add constraints
        let constraints = [
            // have the contentView use the entire view
            contentView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // logoView: top with some padding, centered
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            logoView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            logoView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // buttonView
            buttonView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20.0),
            buttonView.bottomAnchor.constraint(equalTo: scoreView.topAnchor, constant: -20.0),
            buttonView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            buttonView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // gameButton 1
            gameButtons[0].topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 20.0),
            gameButtons[0].bottomAnchor.constraint(equalTo: gameButtons[1].topAnchor, constant: -8.0),
            gameButtons[0].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[0].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            
            // gameButton 2
            gameButtons[1].bottomAnchor.constraint(equalTo: gameButtons[2].topAnchor, constant: -8.0),
            gameButtons[1].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[1].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            
            // gameButton 3
            gameButtons[2].bottomAnchor.constraint(equalTo: gameButtons[3].topAnchor, constant: -8.0),
            gameButtons[2].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[2].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            
            // gameButton 4
            gameButtons[3].bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -8.0),
            gameButtons[3].leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
            gameButtons[3].trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
            
            // gameButtons height
            gameButtons[0].heightAnchor.constraint(equalTo: gameButtons[1].heightAnchor),
            gameButtons[1].heightAnchor.constraint(equalTo: gameButtons[2].heightAnchor),
            gameButtons[2].heightAnchor.constraint(equalTo: gameButtons[3].heightAnchor),
            
            // scoreView
            scoreView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40.0),
            scoreView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            scoreView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            // title Label
            titleLabel.topAnchor.constraint(equalTo: scoreView.topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: recentScoreLabel.topAnchor, constant: -8.0),
            
            // recent Score Label
            recentScoreLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            recentScoreLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor),
            recentScoreLabel.bottomAnchor.constraint(equalTo: highScoreLabel.topAnchor, constant: -8.0),
            
            // high Score Label
            highScoreLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor),
            highScoreLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor),
            highScoreLabel.bottomAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: -8.0),
            
            // title and recent score heights
            titleLabel.heightAnchor.constraint(equalTo: recentScoreLabel.heightAnchor),
            recentScoreLabel.heightAnchor.constraint(equalTo: highScoreLabel.heightAnchor)
        ]
        
        // add horizontal constraints
        midXConstraints = [scoreView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)]
        leftConstraints = [scoreView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor)]
        rightConstraint = [scoreView.leadingAnchor.constraint(equalTo: contentView.trailingAnchor)]
        
        // activate the constraints, start score view at the center when activated
        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate(midXConstraints)
        
        // initialize the timer
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(nextScore), userInfo: nil, repeats: true)
    }
    
    
    // MARK: - Button Handler
    
    func buttonHandler(sender: RoundedButton) {
        // optional View Controller variable
        var vc: UIViewController?
        
        // switch on the sender
        switch sender.tag {
        case 0: // Multiple Choice
            vc = MultipleChoiceViewController()
            
        case 1: // Image 
            print("Image")
            
        case 2: // Right Wrong
            print("Right Wrong")
            
        case 3: // Emoji
            print("Emoji")
            
        default:
            break
        }
        
        // if we have a VC - navigate to it
        if let newVC = vc {
            navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    
    // MARK: - Score Index Management
    
    func nextScore() {
        scoreIndex = scoreIndex < (recentScores.count - 1) ? scoreIndex + 1 : 0
        
        UIView.animate(withDuration: 1.0, animations: { 
            NSLayoutConstraint.deactivate(self.midXConstraints)
            NSLayoutConstraint.activate(self.leftConstraints)
            self.view.layoutIfNeeded()
        }) { (completion: Bool) in
            self.titleLabel.text = self.titles[self.scoreIndex]
            self.recentScoreLabel.text = "Recent: " + String(self.recentScores[self.scoreIndex])
            self.highScoreLabel.text = "Highscore: " + String(self.highScores[self.scoreIndex])
            
            NSLayoutConstraint.deactivate(self.leftConstraints)
            NSLayoutConstraint.activate(self.rightConstraint)
            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 1.0, animations: { 
                NSLayoutConstraint.deactivate(self.rightConstraint)
                NSLayoutConstraint.activate(self.midXConstraints)
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

