//
//  HomeViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI


class HomeViewModel: ObservableObject{
    
    @ObservedObject var apiManager = APIManager()
    
    @Published var category: [Category] = []
     
//    func fetchCategory(){
//        apiManager.fetchCategories()
//        category = apiManager.responseData ?? []
//        print(category.count, "\n", category)
//    }
    
}
