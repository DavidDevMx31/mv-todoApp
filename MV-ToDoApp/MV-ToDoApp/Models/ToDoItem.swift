//
//  ToDoItem.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

struct ToDoItem: Identifiable {
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    
    init(title: String, description: String, isCompleted: Bool = false) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}
