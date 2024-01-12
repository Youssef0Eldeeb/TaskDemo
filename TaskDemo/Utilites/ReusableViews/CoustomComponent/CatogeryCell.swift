//
//  CatogeryCell.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct CatogeryCell: View{
    var name: String
    var isActive: Bool = false
    var nameSpace: Namespace.ID
    
    var body: some View{
        Text(name)
            .font(.caption.bold())
            .padding(.horizontal, 8)
            .padding(10)
            .foregroundColor(isActive ? .white : .black)
            .background{
                if !isActive {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 1)
                        .fill(Color.gray.opacity(0.4))
//                        .matchedGeometryEffect(id: "highlightmenuite", in: nameSpace)
                }else{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.accentColor.opacity(0.8))
                        .matchedGeometryEffect(id: "highlightmenuite", in: nameSpace)
                }
            }
    }
    
}



