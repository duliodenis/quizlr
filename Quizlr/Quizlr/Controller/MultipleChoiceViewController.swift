//
//  MultipleChoiceViewController.swift
//  Quizlr
//
//  Created by Dulio Denis on 12/12/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {
    
    // define the views and constraints for the View
    private let contentView = UIView()
    private var contentViewContstraints: [NSLayoutConstraint]!

    private let questionView = UIView()
    private var questionViewContstraints: [NSLayoutConstraint]!
    
    private let answerView = UIView()
    private var answerViewConstraints: [NSLayoutConstraint]!
    
    private let countdownView = UIView()
    private var countdownViewConstraints: [NSLayoutConstraint]!
    
    // the question view's label and next button
    private let questionLabel = RoundedLabel()
    private var questionLabelConstraints: [NSLayoutConstraint]!
    
    private let questionButton = RoundedButton()
    private var questionButtonConstraints: [NSLayoutConstraint]!
    
    // the answer buttons which we'll add later
    private var answerButtons = [RoundedButton]()
    private var answerButtonContstraints: [NSLayoutConstraint]!
    
    
    // the progress view
    private let progressView = UIProgressView()
    private var progressViewConstraints: [NSLayoutConstraint]!
    
    // background and foreground colors
    private let backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
    private let foregroundColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0)
    
    
    // MARK: - View Lifecycle and Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        layoutView()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func layoutView() {
        
    }

}
