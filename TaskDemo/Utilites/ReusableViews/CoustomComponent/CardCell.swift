//
//  CardCell.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import SwiftUI

struct CardCell: View {
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "house")
                .frame(width: 140, height: 100)
                .background(.gray)
                .cornerRadius(12)
                .scaledToFit()
            VStack(alignment: .leading){
                Text("title")
                    .font(.system(size: 18, weight: .bold, design: .default))
                Text("descriptiondescription")
                    .font(.system(size: 14, weight: .regular, design: .default))
            }
            .padding(.leading, 5)
            .lineLimit(0)
                
        }
        .frame(width: 140, height: 140)
        
    }
}

#Preview {
    CardCell()
}
