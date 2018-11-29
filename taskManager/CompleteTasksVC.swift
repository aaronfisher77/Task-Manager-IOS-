//
//  CompleteTasksVC.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/28/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class CompleteTasksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var completeTasks = taskArrays.sharedInstance.completedArray

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! taskTableViewCell
        
        cell.titleLabel.text = taskArrays.sharedInstance.tasks[indexPath.row].taskTitle
        
        return cell
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainScreen", sender: self)
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! { // Creates a text that displays when there are no games in the library.
        let text = "Video Game Library is Empty" // The text that will be displayed
        let attribs = [ // Sets what the text will look like
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),// Sets font
            NSAttributedString.Key.foregroundColor: UIColor.white // Sets Color
        ]
        
        return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "There currently arent any games in your library" // The text that will be displayed
        
        let para = NSMutableParagraphStyle()
        para.lineBreakMode = NSLineBreakMode.byWordWrapping
        para.alignment = NSTextAlignment.center
        
        let attribs = [ // Sets what the text will look like
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),// Sets font
            NSAttributedString.Key.foregroundColor: UIColor.white, // Sets Color
            NSAttributedString.Key.paragraphStyle: para
        ]
        
        return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Add Game" // The text that will be displayed
        let attribs = [ // Sets what the text will look like
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),// Sets font
            NSAttributedString.Key.foregroundColor: view.tintColor
            
        ];func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
            let text = "Empty Library" // The text that will be displayed
            let attribs = [ // Sets what the text will look like
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), // Sets font
                NSAttributedString.Key.foregroundColor: UIColor.darkGray // Sets Color
            ]
            
            return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
        }
        
        func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
            let text = "There currently arent any games in your library" // The text that will be displayed
            
            let para = NSMutableParagraphStyle()
            para.lineBreakMode = NSLineBreakMode.byWordWrapping
            para.alignment = NSTextAlignment.center
            
            let attribs = [ // Sets what the text will look like
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),// Sets font
                NSAttributedString.Key.foregroundColor: UIColor.darkGray,// Sets Color
                NSAttributedString.Key.paragraphStyle: para
            ]
            
            return NSAttributedString(string: text, attributes: attribs) // Returns the text and attributers as a displayed text
        }
        
        func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
            let text = "Add Game" // The text that will be displayed
            let attribs = [ // Sets what the text will look like
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), // Sets font
                NSAttributedString.Key.foregroundColor: view.tintColor // Sets tint Color
            ]
            
            return NSAttributedString(string: text, attributes: attribs as [NSAttributedString.Key : Any])
        }
        
        func emptyDataSetDidTapButton(_ scrollView: UIScrollView!) {
            performSegue(withIdentifier: "unwindToLibrary", sender: Any.self) // Preforms a segue to the add game function
        }
        
        return NSAttributedString(string: text, attributes: attribs as [NSAttributedString.Key : Any])
    }
    
    func emptyDataSetDidTapButton(_ scrollView: UIScrollView!) {
        performSegue(withIdentifier: "SegueToAddGame", sender: Any.self) // Preforms a segue to the add game function
    }
}
