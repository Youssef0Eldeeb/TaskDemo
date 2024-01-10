//
//  SignupView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import SwiftUI




struct SignupView: View {
    
    @StateObject var viewModel = AuthenticationViewModel(authMethed: .signup)
    
//    @Published var pageArray = [LoginView()]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 50) {
                socialMediaButtons
                textfields
                signinView
                
            }
            .navigationTitle(AppStrings.Signup.title)
        }
        .padding()
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
            PrimaryTextField(placeholder: AppStrings.Signup.Textfield.email, text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            PrimaryTextField(placeholder: AppStrings.Signup.Textfield.password, text: $viewModel.password, secured: true)
            
            Button(AppStrings.Signup.Button.signup){
                viewModel.Authenticate()
            }.buttonStyle(.customButtonStyle())
                .fullScreenCover(isPresented: $viewModel.isAuthenticatedValid, content: {
                    TabBarView(selectedIndex: 0)
                })
            
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var signinView: some View {
        HStack {
            Text(AppStrings.Signup.Text.signin)
            NavigationLink(destination: LoginView(), label: {
                Text(AppStrings.Signup.Button.signin)
                    .foregroundStyle(Color.primaryButton)
//                Button(AppStrings.Signup.Button.signin) {
//                    
//                }
//                .foregroundColor(.primaryButton)
            })
            
        }
    }
    
}

#Preview {
    SignupView()
        .environmentObject(AuthenticationViewModel(authMethed: .signup))
}
