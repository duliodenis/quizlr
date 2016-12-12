//
//  MultipleChoiceViewController.swift
//  Quizlr
//
//  Created by Dulio Denis on 12/12/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}
