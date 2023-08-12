//
//  ToDoListView.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var store: ToDoListStore = ToDoListStore(listSource: ToDoList_LocalService())
    
    @State private var showChangeNameSheet = false
    @State private var showAddItemSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if store.list.items.count != 0 {
                    List(store.list.items) { item in
                        TodoItemCell(item: item)
                            .swipeActions {
                                Button(action: {
                                    store.markItemCompleted(item.id)
                                }, label: {
                                    Label("Marcar completado", systemImage: "checkmark")
                                })
                                .tint(.green)
                                .disabled(item.isCompleted)
                                
                                Button(role: .destructive) {
                                    store.deleteItem(item.id)
                                } label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                    }
                } else {
                    EmptyTodoListView()
                }
            }
            .navigationTitle(store.list.name)
            .sheet(isPresented: $showChangeNameSheet) {
                EditTodoListView(listStore: store)
                    .presentationDetents([.fraction(0.4)])
            }
            .sheet(isPresented: $showAddItemSheet, content: {
                AddTodoItemView(listStore: store)
            })
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    ToolbarEditButton {
                        self.showChangeNameSheet = true
                    }
                
                    ToolbarAddButton() {
                        self.showAddItemSheet = true
                    }
                }
            }
            .task {
                await store.getListItems()
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
