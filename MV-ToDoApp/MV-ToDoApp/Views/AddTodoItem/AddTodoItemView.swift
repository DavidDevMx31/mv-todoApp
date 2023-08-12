//
//  AddTodoItem.swift
//  MV-ToDoApp
//
//  Created by David Ali on 10/08/23.
//

import SwiftUI

struct AddTodoItemView: View {
    @ObservedObject var listStore: ToDoListStore
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var errorMessage = ""
    private var enableSaveButton: Bool {
        guard fieldIsEmpty(title) || fieldIsEmpty(description) else { return false }
        return true
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Título del elemento",
                          text: $title,
                          prompt: Text("Título del elemento"))
                .onSubmit {
                    validateData()
                }
                TextField("Descripción del elemento",
                          text: $description,
                          prompt: Text("Descripción del elemento"))
                .onSubmit {
                    validateData()
                }
            } header: {
                Text("Datos del elemento")
            } footer: {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
            }
            
            Section {
                Button {
                    listStore.addItem(ToDoItem(title: title, description: description))
                    self.dismiss()
                } label: {
                    Text("Agregar elemento")
                }
                .disabled(enableSaveButton)
            }
        }
    }
    
    private func validateData() {
        if fieldIsEmpty(title) {
            errorMessage = "El título es requerido."
        } else if fieldIsEmpty(description) {
            errorMessage = "La descripción es requerida."
        } else {
            errorMessage = ""
        }
    }
    
    private func fieldIsEmpty(_ field: String) -> Bool {
        if field.trimmingCharacters(in: .whitespaces).isEmpty { return true }
        return false
    }
}

struct AddTodoItem_Previews: PreviewProvider {
    static var previews: some View {
        let store = ToDoListStore(listSource: ToDoList_LocalService())
        AddTodoItemView(listStore: store)
    }
}
