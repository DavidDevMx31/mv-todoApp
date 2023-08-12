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
        VStack(alignment: .leading) {
            HStack {
                Text(item.title)
                    .font(.title2)
                
                if item.isCompleted {
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            Text(item.description)
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}


struct TodoItemCell_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemCell(item: ToDoItem(title: "Ejemplo", description: "Ejemplo"))
    }
}
