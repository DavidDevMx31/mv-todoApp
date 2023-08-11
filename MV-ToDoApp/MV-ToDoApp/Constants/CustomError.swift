//
//  CustomError.swift
//  MV-ToDoApp
//
//  Created by David Ali on 10/08/23.
//

import Foundation

//MARK: TodoListStoreErrors
enum ToDoListStoreError: String, Error {
    case listNameRequired
    
    var message: String {
        switch self {
        case .listNameRequired:
            return "El nombre de la lista es requerido."
        }
        //let localizedKey = String.LocalizationValue(self.rawValue)
        //return String(localized: localizedKey)
    }
}
