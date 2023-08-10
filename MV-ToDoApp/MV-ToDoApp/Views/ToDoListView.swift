//
//  ToDoListView.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var store: ToDoListStore = ToDoListStore(listSource: ToDoList_LocalService())
    
    var body: some View {
        NavigationStack {
            if store.list.items.count != 0 {
                List(store.list.items) { item in
                    TodoItemCell(item: item)
                }
                .navigationTitle(store.list.name)
            } else {
                EmptyListView()
            }
        }
        .task {
            await store.getListItems()
        }
    }
}

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

struct EmptyListView: View {
    var body: some View {
        Text("La lista está vacía.")
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
