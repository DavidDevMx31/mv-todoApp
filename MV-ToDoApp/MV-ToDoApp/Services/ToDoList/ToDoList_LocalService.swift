//
//  ToDoList_LocalService.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

class ToDoList_LocalService: ToDoListApi {
    
    func fetchToDoItems() async -> [ToDoItem] {
        return [
            ToDoItem(title: "Tarea 1", description: "Esta es la tarea 1"),
            ToDoItem(title: "Tarea 2", description: "Esta es la tarea 2", isCompleted: true),
            ToDoItem(title: "Tarea 3", description: "Esta es la tarea 3"),
            ToDoItem(title: "Tarea 4", description: "Esta es la tarea 4"),
            ToDoItem(title: "Tarea 5", description: "Esta es la tarea 5")
        ]
    }
    
}
