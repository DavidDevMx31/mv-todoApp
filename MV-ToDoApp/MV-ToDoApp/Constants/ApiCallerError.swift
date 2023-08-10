//
//  ApiCallerError.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

enum ApiCallerError: Error {
    case httpErrorCode
    case decodingFailure
    case invalidData
}
