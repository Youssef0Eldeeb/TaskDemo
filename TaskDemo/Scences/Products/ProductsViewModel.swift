//
//  ProductsViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import Foundation

@MainActor 
class ProductsViewModel: ObservableObject{
    @Published var productsArray: [Product] = []
    
    func fetchProducts(){
        APIManager.shared.fetchDataByCategory(categoryId: "44") { [weak self] responseProducts, error in
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
