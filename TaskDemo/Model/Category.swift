//
//  Category.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import Foundation

struct CategoryData: Codable {
    let data: [Category]?
}

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
