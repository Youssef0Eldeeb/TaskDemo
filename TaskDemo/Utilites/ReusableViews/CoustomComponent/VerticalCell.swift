//
//  VerticalCell.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct VerticalCell: View {
    let product: Product
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: product.image ?? ""))
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name ?? "")
                    .font(.title3)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                
                Text(product.description ?? "")
                    .font(.footnote)
            }
            .lineLimit(2)
            .foregroundColor(.white)
            .padding(10)
            .padding(.vertical, 20)
        }//: ZStack
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .padding()
    }
    
}

//#Preview {
//    VerticalCell(product: .init(id: <#T##Int?#>, price: <#T##Double?#>, oldPrice: <#T##Double?#>, discount: <#T##Int?#>, image: <#T##String?#>, name: <#T##String?#>, description: <#T##String?#>, images: <#T##[String]?#>, inFavorites: <#T##Bool?#>, inCart: <#T##Bool?#>)
//}
