//
//  PrimaryTextField.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import SwiftUI

struct PrimaryTextField: View {
    
    let placeholder: String
    @Binding var text: String
    var secured: Bool = false
    @State private var showPassword = true
    
    var body: some View {
        textField
            .padding(15)
            .background(.textField)
            .mask(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.2))
            }
            .overlay(alignment: .trailing) { if secured { showHidePasswordButton } }
            .onAppear { if secured { showPassword = false } }
        
            
        
    }
    
    var textField: some View{
        Group{
            if showPassword{
                TextField(placeholder, text: $text)
            }else {
                SecureField(placeholder, text: $text)
            }
        }
    }
    var showHidePasswordButton: some View {
        Button {
            showPassword.toggle()
        } label: {
            Image(systemName: showPassword ? "eye.slash" : "eye")
        }
        .padding(.trailing, 18)
    }
    
}

#Preview {
    PrimaryTextField(placeholder: "name", text: .constant("dfdf"), secured: true)
}
