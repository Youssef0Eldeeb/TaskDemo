//
//  ProductsViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import Foundation
import SwiftUI
import Combine

@MainActor 
class ProductsViewModel: ObservableObject{
    @Published var productsArray: [Product] = []
    var categories: [Category] = []
    @ObservedObject var apiManager = APIManager()
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(){
        apiManager.fetchCategories()
    }
    
    func fetchCategory () {
        apiManager.$responseCategoryData.sink { categoryArray in
            self.categories = categoryArray ?? []
            self.fetchProducts(categoryId: "\(self.categories[0].id)")
        }.store(in: &subscriptions)
    }
    
    func fetchProducts(categoryId: String){
        apiManager.fetchDataByCategory(categoryId: categoryId) { [weak self] responseProducts, error in
            if let error = error{
                print(error.localizedDescription)
            }else if let response = responseProducts{
                DispatchQueue.main.async{
                    print(response)
                    self?.productsArray = response
                }
            }
            
        }
    }
    
}
