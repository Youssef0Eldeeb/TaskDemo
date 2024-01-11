//
//  SignupView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var viewModel = SignupViewModel()
    @StateObject private var navigation = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigation.routes) {
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
            .navigationDestination(for: NavigationEnum.self) { route in
                route.view
            }
            
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
                viewModel.signup()
            }.buttonStyle(.customButtonStyle())
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var signinView: some View {
        HStack {
            Text(AppStrings.Signup.Text.signin)
            Button(AppStrings.Login.Button.login) {
                navigation.navigate(to: .login)
            }
            .foregroundColor(.primaryButton)
        }
    }
    
}

#Preview {
    SignupView()
        .environmentObject(SignupViewModel())
}
