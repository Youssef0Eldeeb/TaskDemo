//
//  UserDefaultManager.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 10/01/2024.
//

import Foundation

class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    
    private let userDefaults = UserDefaults.standard
    private let userKey = "userKey"
    
    // Function to save user
    func saveUser(_ user: User) {
        do {
            let encoder = JSONEncoder()
            let userData = try encoder.encode(user)
            userDefaults.set(userData, forKey: userKey)
        } catch {
            print("Error encoding user: \(error.localizedDescription)")
        }
    }
    
    // Function to get user
    func getUser() -> User? {
        if let userData = userDefaults.data(forKey: userKey) {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: userData)
                return user
            } catch {
                print("Error decoding user: \(error.localizedDescription)")
            }
        }
        return nil
    }
    func deleteUser() {
        userDefaults.removeObject(forKey: userKey)
    }

}
