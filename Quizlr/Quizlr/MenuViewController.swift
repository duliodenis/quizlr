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
        titleLabel.text = "Multiple Choice"
        recentScoreLabel.text = "Recent: 0"
        highScoreLabel.text = "Highscore: 0"
        
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
            scoreView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
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
        
        // activate the constraints
        NSLayoutConstraint.activate(constraints)
    }
    
}

