//
//  ToDoListStore.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

@MainActor
class ToDoListStore: ObservableObject {
    //MARK: Properties
    private let listApi: ToDoListApi
    
    //MARK: Published properties
    @Published var list: ToDoList
    @Published var errorMessage: ToDoListStoreError?
    
    //MARK: Init
    init(listSource: ToDoListApi) {
        listApi = listSource
        list = ToDoList(name: "Nueva lista", items: [])
    }
    
    func getListItems() async {
        list = ToDoList(name: "Mi lista", items: await listApi.fetchToDoItems())
    }
    
    func changeListName(_ newName: String) {
        if newName.isEmpty {
            errorMessage = .listNameRequired
            return
        }
        list.changeName(newName)
        errorMessage = nil
    }
    
    func removeAllItems() {
        list.removeItems()
    }
    
    func markItemCompleted(_ itemId: String) {
        list.markItemCompleted(itemId: itemId)
    }
}
