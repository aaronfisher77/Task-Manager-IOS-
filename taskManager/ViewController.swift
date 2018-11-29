//
//  ViewController.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/26/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var taskToSend: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) { } // creates a func that allows this to be unwinded to


    func markTaskCompleted(at indexPath: IndexPath) {
        let task = taskArrays.sharedInstance.tasks[indexPath.row] // Identifies what game it is talking about
        task.completedOrNot = .taskComplete // Sets the availibility to checked out
        tableView.cellForRow(at: indexPath)?.backgroundColor = .green// Refreshed info
    }
    
    func markTaskIncomplete(at indexPath: IndexPath) { // Identifies what game it is talking about
        let task = taskArrays.sharedInstance.tasks[indexPath.row] // Identifies what game it is talking about
        task.completedOrNot = .taskIncomplete // Sets the availibility to checked out
        tableView.cellForRow(at: indexPath)?.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // prepares the sugue to the information page
        if let destination = segue.destination as? InformationVC { // Sets the destination ot information page
            destination.task = taskToSend
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.taskToSend = taskArrays.sharedInstance.tasks[indexPath.row]
        self.performSegue(withIdentifier: "segueToInfoPage", sender: taskTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArrays.sharedInstance.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! taskTableViewCell
        
        cell.titleLabel.text = taskArrays.sharedInstance.tasks[indexPath.row].taskTitle
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            taskArrays.sharedInstance.tasks.remove(at: indexPath.row) // removes task from task array
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let task = taskArrays.sharedInstance.tasks[indexPath.row] // Specify row
        
        switch task.completedOrNot {
        // Creates the taskComplete and TaskIncomplete functions
        case .taskComplete:
            
            let markIncomplete = UITableViewRowAction(style: .normal, title: "Incomplete") { _, indexPath in // Creates an option in for the cell to make a task incomplete
                
                self.markTaskIncomplete(at: indexPath) // Checks out at selected cell
            }
            
            return [deleteAction, markIncomplete]
            
        case .taskIncomplete:
            let markComplete = UITableViewRowAction(style: .normal, title: "Complete") { _, indexPath in// Creates an option in for the cell to check out game
                
                self.markTaskCompleted(at: indexPath)// Checks out at selected cell
            }
            
            return [deleteAction, markComplete]
            
        }
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

