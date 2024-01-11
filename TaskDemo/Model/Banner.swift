//
//  Banner.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 11/01/2024.
//

import Foundation


struct HomeResponse: Codable {
    let data: HomeData
}

struct HomeData: Codable{
    let banners: [Banner]
    let products: [Product]
    let ad: String
}

struct Banner: Codable, Hashable{
    let id: Int?
    let image: String?
    let category: String?
    let product: String?
}
