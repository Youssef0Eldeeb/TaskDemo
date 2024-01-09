//
//  ApiManager.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

@MainActor
class APIManager: ObservableObject {
    
    
    @Published var responseData: [Category]?
    @Published var error: Error?
    
    func fetchCategories() {
        Task{
            guard let url = URL(string: "https://student.valuxapps.com/api/categories") else {return}
            
            do{
                let (data, response) = try await URLSession.shared.data(from: (url))
                guard let httpRespnse = response as? HTTPURLResponse, httpRespnse.statusCode == 200 else{
                    return
                }
                let result = try JSONDecoder().decode(DataClass.self, from: data)
                self.responseData = result.data
                print(responseData)
                
            }catch{
                print(error.localizedDescription)
                setError(error)
            }
        }
    }
        
    
    private func setError(_ error: Error) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
}


