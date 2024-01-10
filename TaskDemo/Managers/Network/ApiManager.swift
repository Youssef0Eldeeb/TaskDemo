//
//  ApiManager.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

@MainActor
class APIManager: ObservableObject {
    
    static let shared = APIManager()
    
    @Published var responseCategoryData: [Category]?
    @Published var error: Error?
    
//    private init() {}
    
    func fetchCategories() {
        Task{
            guard let url = URL(string: "https://student.valuxapps.com/api/categories") else {return}
            
            do{
                let (data, response) = try await URLSession.shared.data(from: (url))
                guard let httpRespnse = response as? HTTPURLResponse, httpRespnse.statusCode == 200 else{
                    return
                }
                let result = try JSONDecoder().decode(CategoryData.self, from: data)
                self.responseCategoryData = result.data
                print(responseCategoryData)
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func fetchDataByCategory(categoryId: String, completion: @escaping ([Product]?, Error?) -> (Void)){
        
        guard let url = URL(string: "https://student.valuxapps.com/api/categories/\(categoryId)") else {return}
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data , error == nil else {
                completion(nil, error)
                return
            }
            do{
                let decodedData = try JSONDecoder().decode(ProductData.self, from: data)
                DispatchQueue.main.async{
                    print(decodedData)
                    completion(decodedData.data, nil)
                }
            }catch{
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
    }
        
    
}


