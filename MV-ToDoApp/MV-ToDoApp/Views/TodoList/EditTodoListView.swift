//
//  ChangeTodoListNameView.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import SwiftUI

struct EditTodoListView: View {
    @ObservedObject var listStore: ToDoListStore
    @Environment(\.dismiss) var dismiss
    
    @State private var listName: String = ""
    @State private var showRemoveItemsAlert: Bool = false
    
    var body: some View {
        Form {
            Section {
                TextField("Nombre de la lista",
                          text: $listName,
                          prompt: Text("Ingresa el nombre de la lista"))
                .onSubmit {
                    saveListName(listName)
                }
            } header: {
                Text("Nombre de la lista")
            } footer: {
                Text(listStore.errorMessage?.message ?? "")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Section {
                Button(role: .destructive) {
                    self.showRemoveItemsAlert = true
                } label: {
                    Text("Vaciar lista")
                }
                .disabled(listStore.list.items.count == 0)
            } header: {
                Text("Acciones")
            }
            .alert("¿Estás seguro que deseas vaciar la lista?", isPresented: $showRemoveItemsAlert) {
                Button(role: .destructive) {
                    removeListItems()
                    self.dismiss()
                } label: {
                    Text("Vaciar")
                }
            }
        }
        .task {
            listName = listStore.list.name
        }
    }
    
    private func saveListName(_ listName: String) {
        listStore.changeListName(listName)
        if listStore.errorMessage == nil { self.dismiss() }
    }
    
    private func removeListItems() {
        listStore.removeAllItems()
    }
}

struct ChangeTodoListNameView_Previews: PreviewProvider {
    
    static var previews: some View {
        let listStore = ToDoListStore(listSource: ToDoList_LocalService())
        EditTodoListView(listStore: listStore)
    }
}
