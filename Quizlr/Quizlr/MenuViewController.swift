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
    }
    
}

