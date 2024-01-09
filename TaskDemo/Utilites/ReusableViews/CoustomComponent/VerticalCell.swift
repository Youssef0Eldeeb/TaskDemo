//
//  VerticalCell.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct VerticalCell: View {
    let title: String
    let description: String
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: ""))
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
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
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .padding()
    }
    
}

#Preview {
    VerticalCell(title: "Item", description: "This is Item")
}
