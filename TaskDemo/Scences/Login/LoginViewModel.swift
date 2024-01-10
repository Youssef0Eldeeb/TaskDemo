//
//  LoginViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    @Published var isAuthenticationValid: Bool = false
    
    func reset() {
        email = ""
        password = ""
    }
    
    func validateAuthentication(){
        guard email.isEmpty || password.isEmpty else{
            isAuthenticationValid = false
            return
        }
        isAuthenticationValid = isValidEmail(email) && password.count >= 8
    }
    
    
    func login() {
        
        let userDefaults = UserDefaults.standard
        
        AuthenticationManager.shared.login(username: email, password: password) { result in
            switch result {
            case .success(let token):
                userDefaults.setValue(token, forKey: "JsonWebToken")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
