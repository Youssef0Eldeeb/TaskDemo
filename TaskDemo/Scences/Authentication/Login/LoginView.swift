//
//  LoginView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                loginTitle
                Spacer()
                socialMediaButtons
                Spacer()
                textfields
                signinView
                Spacer()
            }
            .padding()
            if viewModel.isLoading{
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
                    .scaleEffect(2)
            }
        }
    }
    private var loginTitle: some View{
        Text(AppStrings.Login.title)
            .font(.system(size: 32, weight: .semibold, design: .default))
    }
    
    private var socialMediaButtons: some View {
        VStack{
            Button(AppStrings.Signup.Button.apple){
                //
            }.buttonStyle(.customButtonStyle())
            Button(AppStrings.Signup.Button.google){
                //
            }.buttonStyle(.customButtonStyle())
        }
    }
    
    private var textfields: some View {
        VStack(spacing: 16){
            PrimaryTextField(placeholder: AppStrings.Login.Textfield.email, text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            PrimaryTextField(placeholder: AppStrings.Login.Textfield.password, text: $viewModel.password, secured: true)
            
            Button(AppStrings.Login.Button.login){
                viewModel.login()
            }.buttonStyle(.customButtonStyle())
            
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var signinView: some View {
        VStack{
            HStack {
                Text(AppStrings.Signup.Text.notmember)
                Button(AppStrings.Signup.Button.signup) {
                    dismiss()
                }
                .foregroundColor(.primaryButton)
            }
        }
    }
    
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
