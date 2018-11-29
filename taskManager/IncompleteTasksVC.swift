//
//  IncompleteTasksVC.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/28/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class IncompleteTasksVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var incompleteTasks = taskArrays.sharedInstance.IncompleteArray

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incompleteTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! taskTableViewCell
        
        cell.titleLabel.text = taskArrays.sharedInstance.tasks[indexPath.row].taskTitle
        
        return cell
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainScreen", sender: self)
    }
    
    
}
