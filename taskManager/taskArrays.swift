//
//  taskArray.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/26/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class taskArrays {
    //Singleton
    static let sharedInstance = taskArrays() // Createz a global variable called a singleton
    
    var tasks = [Task]()
    
    var completedArray: [Task] {
        var tempArray = [Task]()
        for task in tasks {
            if task.completedOrNot.bool {
                tempArray.append(task)
            }
        }
        return tempArray
    }
    
    var IncompleteArray: [Task]{
        var tempArray = [Task]()
        for task in tasks {
            if !task.completedOrNot.bool {
                tempArray.append(task)
            }
        }
        return tempArray
    }
    
    
    
    
    
    
}
