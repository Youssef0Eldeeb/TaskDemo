//
//  SignupView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import SwiftUI
import AlertKit

struct SignupView: View {
    
    @StateObject var viewModel = SignupViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(spacing: 50) {
                    socialMediaButtons
                    textfields
                    signinView
                    
                }
                if viewModel.isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                        .scaleEffect(2)
                }
                
            }
            .padding()
            .navigationTitle(AppStrings.Signup.title)
        }
        
        .onAppear{
            viewModel.reset()
            
        }
        
    }
    
    private var socialMediaButtons: some View {
        VStack{
            Button(AppStrings.Signup.Button.apple){
                
            }.buttonStyle(.customButtonStyle())
            Button(AppStrings.Signup.Button.google){
                
            }.buttonStyle(.customButtonStyle())
            
        }
    }
    
    private var textfields: some View {
        VStack(spacing: 16){
            PrimaryTextField(placeholder: AppStrings.Signup.Textfield.name , text: $viewModel.name)
            PrimaryTextField(placeholder: AppStrings.Signup.Textfield.phone, text: $viewModel.phone)
            PrimaryTextField(placeholder: AppStrings.Signup.Textfield.email, text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            PrimaryTextField(placeholder: AppStrings.Signup.Textfield.password, text: $viewModel.password, secured: true)
            
            Button(AppStrings.Signup.Button.signup){
                viewModel.signup(completion: {
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
        HStack {
            Text(AppStrings.Signup.Text.signin)
            NavigationLink {
                LoginView()
            } label: {
                Text(AppStrings.Login.Button.login)
                    .foregroundColor(.primaryButton)
            }
        }
    }
    
}

#Preview {
    SignupView()
        .environmentObject(SignupViewModel())
}
