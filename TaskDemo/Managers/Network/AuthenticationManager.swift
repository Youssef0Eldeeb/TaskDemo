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
struct SignupRequestBody: Codable{
    let name: String
    let phone: String
    let email: String
    let password: String
}
enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}


class AuthenticationManager: ObservableObject{
    
    static let shared = AuthenticationManager()
    
//    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Result<AuthResponse, AuthenticationError>) -> (Void)){
        guard let url = URL(string: "https://student.valuxapps.com/api/login") else {
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
            
            guard let loginResponse = try? JSONDecoder().decode(AuthResponse.self, from: data) else{
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(loginResponse))
        }.resume()
        
    }
    
    func signup(name: String, phone: String, email: String, password: String, completion: @escaping (Result<AuthResponse, AuthenticationError>) -> (Void)){
        guard let url = URL(string: "https://student.valuxapps.com/api/register") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = SignupRequestBody(name: name, phone: phone, email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let signupResponse = try? JSONDecoder().decode(AuthResponse.self, from: data) else{
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(signupResponse))
        }.resume()
    }
    
    
}
