//
//  Tasks.swift
//  taskManager
//
//  Created by Aaron Fisher on 11/26/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import Foundation

class Task {
    
    enum CompletedOrNot {
        case taskComplete
        case taskIncomplete
        
        var bool: Bool {
            switch self {
            case .taskComplete:
                return true
            case .taskIncomplete:
                return false
            }
        }
    }
    
    var taskTitle: String
    var taskDescription: String
    var completedOrNot : CompletedOrNot
    
    init(taskTitle: String, taskDescription: String) {
        self.taskTitle = taskTitle
        self.taskDescription = taskDescription
        self.completedOrNot = .taskIncomplete
    }
    
}
