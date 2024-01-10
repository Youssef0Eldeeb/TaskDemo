//
//  AuthenticationManager.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 10/01/2024.
//

import Foundation

struct LoginRequestBody: Codable{
    let email: String
    let password: String
}
struct LoginResponse: Codable{
    let token: String?
//    let message: String?
//    let success: Bool?
}

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}



class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> (Void)){
        guard let url = URL(string: "https://diamond-wooded-dilophosaurus.glitch.me/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else{
                completion(.failure(.invalidCredentials))
                return
            }
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
        }.resume()
        
    }
}
