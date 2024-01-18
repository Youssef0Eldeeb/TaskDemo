//
//  SignupViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 10/01/2024.
//

import Foundation

class SignupViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var userResponse: AuthResponse = .init(status: true, message: "nil")
    
    var name: String = ""
    var phone: String = ""
    var email: String = ""
    var password: String = ""
    
    func reset() {
        email = ""
        password = ""
    }
    
    func signup(completion: @escaping()->()) {
        DispatchQueue.main.async{
            self.isLoading = true
        }
        guard isValidEmail(email) && password.count >= 8 else {return}
        AuthenticationManager.shared.signup(name: name, phone: phone, email: email, password: password) { result in
            DispatchQueue.main.async{
                self.isLoading = false
            }
            switch result {
            case .success(let userResponse):
                self.userResponse = userResponse
                completion()
                AppRouter.shared.login(userResponse.data)
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
