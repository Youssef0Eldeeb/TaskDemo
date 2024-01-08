//
//  SignupViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func reset() {
        name = ""
        email = ""
        password = ""
    }
    
    func signin(onSuccess: () -> Void, onError: () -> Void) {
        
    }
}

