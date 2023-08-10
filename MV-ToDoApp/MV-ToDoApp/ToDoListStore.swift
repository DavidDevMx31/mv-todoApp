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
    
    //MARK: Init
    init(listSource: ToDoListApi) {
        listApi = listSource
        list = ToDoList(name: "Nueva lista", items: [])
    }
    
    func getListItems() async {
        list = ToDoList(name: "Mi lista", items: await listApi.fetchToDoItems())
    }
}
