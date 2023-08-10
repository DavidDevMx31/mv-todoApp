//
//  ApiCaller.swift
//  MV-ToDoApp
//
//  Created by David Ali on 09/08/23.
//

import Foundation

final class ApiCaller {
    private let session: URLSession
    
    init() {
        session = URLSession.shared
    }
    
    func executeDataRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            
            //Validamos codigo de la respuesta
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                //Codigo http de error
                throw ApiCallerError.httpErrorCode
            }
            
            //Leer json
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
            
        } catch let decodingError as DecodingError {
            switch decodingError {
            case .typeMismatch(_, let context),
                 .valueNotFound(_, let context),
                 .keyNotFound(_, let context),
                 .dataCorrupted(let context):
                debugPrint(context.debugDescription)
                throw ApiCallerError.decodingFailure
            @unknown default:
                throw ApiCallerError.decodingFailure
            }
        }
        catch let error {
            debugPrint(error.localizedDescription)
            throw ApiCallerError.invalidData
        }
    }
}
