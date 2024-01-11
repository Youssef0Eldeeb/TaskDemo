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
     
    func fetchHomeResponse (){
        apiManager.fetchHomeResponse { homeData, error in
            guard let homeData = homeData, error == nil else{
                print(error!.localizedDescription)
                return
            }
            self.banners = homeData.banners
            self.popularProducts = homeData.products
        }
    }
    
    
}
