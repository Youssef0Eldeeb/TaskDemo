//
//  Category.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import Foundation

struct CategoryResponse: Codable {
    let data: CategoryData
}

struct CategoryData: Codable {
    let data: [Category]?
}

struct Category: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
}
