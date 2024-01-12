//
//  HomeViewModel.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI


class HomeViewModel: ObservableObject{
    
    @ObservedObject var apiManager = APIManager()
    @Published var banners: [Banner] = []
    @Published var popularProducts: [Product] = []
     
    func fetchHomeResponse ()async throws{
        let homeData = try await apiManager.fetchData(url: url_Home, responseClass: HomeResponse.self)
        
        self.banners = homeData.data.banners
        self.popularProducts = homeData.data.products
    }
     
}
