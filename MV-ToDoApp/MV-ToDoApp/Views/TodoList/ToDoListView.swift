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
            Group {
                if store.list.items.count != 0 {
                    List(store.list.items) { item in
                        TodoItemCell(item: item)
                    }
                } else {
                    EmptyTodoListView()
                }
            }
            .navigationTitle(store.list.name)
        }
        .task {
            await store.getListItems()
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
