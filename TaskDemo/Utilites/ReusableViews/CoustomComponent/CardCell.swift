//
//  CardCell.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import SwiftUI

struct CardCell: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: product.image ?? ""), content: { image in
                image.resizable() 
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {})
            .frame(width: 160, height: 120)
            .cornerRadius(12)
                
            VStack(alignment: .center){
                Text(product.name ?? "")
                    .font(.system(size: 18, weight: .bold, design: .default))
                Text("Price: \(String(format: "%.2f", arguments: [product.price ?? 0.0]))")
                    .font(.system(size: 14, weight: .regular, design: .default))
            }
            .padding(.leading, 5)
            .padding(.bottom, 5)
            .lineLimit(0)
                
        }
        .frame(width: 160, height: 170)
        .background()
        .cornerRadius(12)
        .shadow(radius: 2)
        
        
    }
}

#Preview {
    CardCell(product: .init(id: nil, price: 234, oldPrice: nil, discount: nil, image: "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg", name: "iphone 12", description: "", images: nil, inFavorites: nil, inCart: nil))
}
