//
//  AppRouter.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 10/01/2024.
//

import Foundation
import SwiftUI

final class AppRouter: ObservableObject {
    public static let shared = AppRouter()
    private let userDefaultManager = UserDefaultManager.shared
    
    @Published public var rootView: any View = Text("")
        
    private init() {
        self.updateRootView()
    }

    public func login(_ user: User?) {
        if let user = user {
            userDefaultManager.saveUser(user)
            updateRootView()
        }
        
    }
   
    public func logout() {
        userDefaultManager.deleteUser()
        updateRootView()
    }
    
    private func updateRootView() {
        if let _ = userDefaultManager.getUser() {
            rootView = TabBarView(selectedIndex: 0)
        } else {
            rootView = SignupView()
        }
    }
}
