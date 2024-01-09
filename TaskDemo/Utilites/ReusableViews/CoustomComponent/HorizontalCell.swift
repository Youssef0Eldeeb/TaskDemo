//
//  HorizontalCell.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct HorizontalCell: View {
    let title: String
    let description: String
    let imageUrl: String
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: imageUrl))
                .frame(width: 300, height: 250)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                Text(title)
                    .font(.title3)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.footnote)
            }
            .lineLimit(2)
            .foregroundColor(.white)
            .padding(10)
            .padding(.vertical, 20)
        }//: ZStack
        .cornerRadius(10)
        .frame(width: 300, height: 250)
        
    }
}

#Preview {
    HorizontalCell(title: "T-Shirt", description: "this is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirtthis is t-shirt ",imageUrl: "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg")
}
