//
//  ApiManager.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI
enum NetworkError: Error {
    case wrongUrl, responseFailed, statusError
}
@MainActor
class APIManager: ObservableObject {
    
    
    func fetchData<T: Decodable>(url: String, responseClass: T.Type) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw NetworkError.wrongUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: (url))
        guard let httpRespnse = response as? HTTPURLResponse else{
            throw NetworkError.responseFailed
        }
        guard httpRespnse.statusCode == 200 else {
            throw NetworkError.statusError
        }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
        
    }
    
}


