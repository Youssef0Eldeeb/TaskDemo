//
//  TaskDemoApp.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import SwiftUI

@main
struct TaskDemoApp: App {
    
    @StateObject private var appRouter = AppRouter.shared
    
    var body: some Scene {
        WindowGroup {
            AnyView(appRouter.rootView)
        }
    }
}
