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
        
    }
    
}

