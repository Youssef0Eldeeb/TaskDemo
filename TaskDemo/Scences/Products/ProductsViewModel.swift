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
    @ObservedObject var apiManager = APIManager()
    @Published var selectedProduct: Product? = nil
    
    private var subscriptions: Set<AnyCancellable> = []
    
    
    func fetchCategories () async throws -> [Category]? {
        let categoryResponse =  try await apiManager.fetchData(url: "https://student.valuxapps.com/api/categories", responseClass: CategoryResponse.self)
        return categoryResponse.data.data
    }
    
    
    func fetchProducts(categoryId: String)async throws{
        
        let productData = try await apiManager.fetchData(url: "https://student.valuxapps.com/api/categories/\(categoryId)", responseClass: ProductResponse.self)
        
        self.productsArray = productData.data.data ?? []
        
    }
    
}
