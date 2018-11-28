//
//  AddTaskVC.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/26/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard // makes sure the variables have values
            
            let title = titleInput.text, !title.isEmpty, // makes sure that the title is filled in before creating a new task
            let description = descriptionInput.text, !description.isEmpty // makes sure that the discription is filled in before creating a new task
            
            else{
                // Pops up an error message that makes sure you have everything filled in
                let errorAlert = UIAlertController(title: "Wait!", message: "Please ensure that all fields are filled or press back to return to the main screen", preferredStyle: UIAlertController.Style.alert)
                // Allows you to dismiss the alert when you are
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {UIAlertAction in})
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil) // This makes for a cleaner transition when the error pops up
                return
        }
        
        taskArrays.sharedInstance.tasks.append(Task(taskTitle: title, taskDescription: description)) // creates a new "Game" and enters it into the code.
            self.dismiss(animated: true, completion: nil)
        print(taskArrays.sharedInstance.tasks.count)
        self.performSegue(withIdentifier: "unwindToMainScreen", sender: self) // Unwinds to the library
    }
    
    @IBAction func backButton(_ sender: Any) { // Back Button
        performSegue(withIdentifier: "unwindToMainScreen", sender: Any.self) // Unwinds to the MainScreenVC when back button is pressed
    }
}
