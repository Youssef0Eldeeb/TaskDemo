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
        HStack(){
            AsyncImage(url: URL(string: product.image ?? ""), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {})
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            .background(Color(.systemBackground))
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name ?? "")
                    .font(.title3)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                
                Text(product.description ?? "")
                    .font(.footnote)
            }
            .lineLimit(2)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            
        }//: HStack
        .background(Color.tabBarBackground)
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .shadow(radius: 3)
        .padding(.vertical, 5)
    }
    
}

#Preview {
    VerticalCell(product: .init(id: nil, price: nil, oldPrice: nil, discount: nil, image: nil, name: "ProductName", description: "descripton", images: nil, inFavorites: nil, inCart: nil))
}
