//
//  ToDoList.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

struct ToDoList {
    private(set) var name: String
    private(set) var items: [ToDoItem]
    
    mutating func changeName(_ newName: String) {
        self.name = newName
    }
    
    mutating func removeItems() {
        self.items.removeAll()
    }
    
    mutating func markItemCompleted(itemId: String) {
        guard let itemIndex = self.items.firstIndex(where: { $0.id == itemId }) else { return }
        self.items[itemIndex].markCompleted()
    }
    
    mutating func addItem(_ todoItem: ToDoItem) {
        self.items.append(todoItem)
    }
}
