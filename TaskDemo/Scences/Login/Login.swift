//
//  Login.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView{
            VStack(spacing: 50) {
                socialMediaButtons
                textfields
                signinView
                
            }
//            .background(Color.background)
            .navigationTitle(AppStrings.Signup.title)
        }
        .padding()
        .onAppear{
            viewModel.reset()
        }
//        .background(Color.background)
        
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
            
            Button(AppStrings.Signup.Button.signup){
                //
            }.buttonStyle(.customButtonStyle())
            
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var signinView: some View {
        HStack {
            Text(AppStrings.Signup.Text.signin)
            Button(AppStrings.Signup.Button.signin) {
                //
            }
            .foregroundColor(.primaryButton)
        }
    }
    
}

#Preview {
    Login()
        .environmentObject(LoginViewModel())
}
