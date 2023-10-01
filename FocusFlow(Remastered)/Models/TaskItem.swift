//
//  TaskItem.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/5/23.
//

import Foundation
struct TaskItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var completed: Bool
    
    mutating func setDone(_ state: Bool){
        completed = state
    }
}
