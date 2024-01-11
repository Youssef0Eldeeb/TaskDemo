//
//  ProductsView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject private var navigation = NavigationManager()
    @ObservedObject var viewModel = ProductsViewModel()
    @Namespace private var menuItemTransition
    @State var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                catogeryCollection
                verticalCollection
            }
            .navigationTitle("Products")
        }
        .onAppear {
            viewModel.fetchCategory()
        }
    }
    var catogeryCollection: some View{
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(viewModel.categories.indices, id: \.self){ index in
                        CatogeryCell(name: viewModel.categories[index].name, isActive: selectedIndex == index, nameSpace: menuItemTransition)
                            .onTapGesture{
                                withAnimation(.easeInOut) {
                                    self.selectedIndex = index
                                }
                                viewModel.fetchProducts(categoryId: "\(viewModel.categories[index].id)")
                            }
                            .onChange(of: selectedIndex) { newValue in
                                withAnimation {
                                    scrollView.scrollTo(newValue, anchor: .center)
                                }
                            }
                    }
                } //: HStack
                .padding(.horizontal, 15)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(25)
            }//: ScrollView
        }
        
    }
    
    var verticalCollection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ForEach(viewModel.productsArray, id: \.self){ product in
                    
                    VerticalCell(product: product)
                        .onTapGesture {
                            navigation.navigate(to: .details)
                        }
                }
            }
            .padding()
        }
    }
    
}

#Preview {
    ProductsView()
}
