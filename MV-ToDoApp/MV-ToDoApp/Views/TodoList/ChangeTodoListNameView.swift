//
//  ChangeTodoListNameView.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import SwiftUI

struct ChangeTodoListNameView: View {
    @ObservedObject var listStore: ToDoListStore
    @Environment(\.dismiss) var dismiss
    
    @State private var listName: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Nombre de la lista",
                          text: $listName,
                          prompt: Text("Ingresa el nombre de la lista"))
                .onSubmit {
                    listStore.changeListName(listName)
                    if listStore.errorMessage == nil { self.dismiss() }
                }
            } header: {
                Text("Nombre de la lista")
            } footer: {
                Text(listStore.errorMessage ?? "")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .task {
            listName = listStore.list.name
        }
    }
}

struct ChangeTodoListNameView_Previews: PreviewProvider {
    
    static var previews: some View {
        let listStore = ToDoListStore(listSource: ToDoList_LocalService())
        ChangeTodoListNameView(listStore: listStore)
    }
}
