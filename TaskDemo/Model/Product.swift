//
//  Product.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import Foundation

struct ProductData: Codable {
    let data: [Product]?
}

struct Product: Codable, Identifiable, Hashable {
    let id: Int?
    let price, oldPrice: Double?
    let discount: Int?
    let image: String?
    let name, description: String?
    let images: [String]?
    let inFavorites, inCart: Bool?
}
