//
//  LoginView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI
import AlertKit

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
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
                viewModel.login(completion: {
                    if !self.viewModel.userResponse.status {
                        self.showAlert = true
                    }
                })
            }.buttonStyle(.customButtonStyle())
                .alert(isPresent: $showAlert, view: alertView(message: viewModel.userResponse.message))
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    private func alertView(message: String) -> AlertAppleMusic16View{
        AlertAppleMusic16View(title: "", subtitle: message, icon: .error)
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
