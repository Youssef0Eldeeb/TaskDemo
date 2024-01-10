//
//  NavigationManager.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 10/01/2024.
//

import SwiftUI

// Observable class managing the navigation stack in the application
class Navigation<Enum: Equatable>: ObservableObject {
    @Published var routes: [Enum] = [] // Stack of navigation routes
    // Function to navigate to a specific route
    func navigate(to route: Enum) {
        routes.append(route)
    }
    
    // Function to return to the root of the navigation stack
    func popToRoot() {
        routes = []
    }
    
    // Function to pop the navigation stack up to a specified route
      func pop(to route: Enum) {
          // Check if the route exists in the stack
          if let index = routes.lastIndex(where: { $0 == route }) {
              // Remove routes above the specified route
              routes = Array(routes.prefix(upTo: index + 1))
          }
      }
}

// Enumeration for various navigation states in the application
enum NavigationEnum: Hashable {
    case login
    case signup
    case home
    case product
    case details
    
    @ViewBuilder
    var view: some View {
        switch self {
            case .login: LoginView()
            case .signup: SignupView()
            case .home: HomeView()
            case .details: DetailsView()
            case .product: ProductsView()
        }
    }
}

class NavigationManager: Navigation<NavigationEnum> { }
