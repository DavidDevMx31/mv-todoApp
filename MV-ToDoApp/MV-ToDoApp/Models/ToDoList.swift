//
//  ToDoList.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

struct ToDoList {
    private(set) var name: String
    var items: [ToDoItem]
    
    mutating func changeName(_ newName: String) {
        self.name = newName
    }
}
