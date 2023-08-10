//
//  TodoItemCell.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import SwiftUI


struct TodoItemCell: View {
    let item: ToDoItem
    
    var body: some View {
        HStack {
            if item.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            Text(item.title)
        }
    }
}


struct ToDoItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemCell()
    }
}
