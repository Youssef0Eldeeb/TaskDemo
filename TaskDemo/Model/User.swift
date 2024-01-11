//
//  User.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 10/01/2024.
//

import Foundation

struct AuthResponse: Codable {
    var status: Bool?
    var message: String?
    var data: User?
}

struct User: Codable {
    var name: String?
    var phone: String?
    var email: String?
    var id: Int?
    var image: String?
    var token: String?
}


