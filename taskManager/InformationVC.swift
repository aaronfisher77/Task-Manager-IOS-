//
//  InformationVC.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/28/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class InformationVC: UIViewController {
    
    // Variables
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    
    // New instance
    var task: Task?
    //= Task(taskTitle: "Devotional", description: "A time spent with the Lord")
    
    override func viewDidLoad() {
        guard let safeTask = task else {
            print("nothing came through")
            return
        }
        // Sets Labels to Tasks Labels
        taskTitle.text = safeTask.taskTitle
        taskDescription.text = safeTask.taskDescription
        print(safeTask.taskDescription)
        
        // Sets the backround color to the color of the task (complete or incomplete)
        switch safeTask.completedOrNot {
        case .taskIncomplete:
            view.backgroundColor = .red
        case .taskComplete:
            view.backgroundColor = . green
        }
        
    }
    
    // Back button that unwonds to main screen
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainScreen", sender: self)
    }
}
