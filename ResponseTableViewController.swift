//
//  ResponseTableViewController.swift
//  Survey
//
//  Created by Justin Carver on 9/1/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class ResponseTableViewController: UITableViewController {
    
    var surveys: [Survey] = [] {
        didSet {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        SurveyController.getSurveys { (survey) in
            self.surveys = survey
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return surveys.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResponseCell", forIndexPath: indexPath)

        let survey = surveys[indexPath.row]
        cell.textLabel?.text = survey.response
        cell.detailTextLabel?.text = survey.name

        return cell
    }
}








