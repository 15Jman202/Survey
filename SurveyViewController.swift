//
//  SurveyViewController.swift
//  Survey
//
//  Created by Justin Carver on 9/1/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBAction func SubmitButtonTapped(sender: AnyObject) {
        guard let favMovie = favMovieTextField.text, name = nameTextField.text where !favMovie.isEmpty && !name.isEmpty else {
            print("Nothing in the text fields")
            return }
        let survey = Survey(name: name, response: favMovie)
        
        favMovieTextField.text = ""
        nameTextField.text = ""
        
        SurveyController.putSurvey(survey) { (success) in
            if success == false {
                print("Error Putting Surveys")
            }
        }
    }
    
    @IBOutlet weak var favMovieTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
