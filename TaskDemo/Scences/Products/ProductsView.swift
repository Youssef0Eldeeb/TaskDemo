//
//  ProductsView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import SwiftUI


struct ProductsView: View {
    
    @StateObject private var navigation = NavigationManager()
    @StateObject private var viewModel = ProductsViewModel()
    @Namespace private var menuItemTransition
    @State var selectedIndex: Int = 0
    @State private var categories: [Category] = []
    
    var body: some View {
        NavigationStack(path: $navigation.routes){
            VStack{
                catogeryCollection
                verticalCollection
            }
            .navigationTitle("Products")
        }
        .navigationDestination(for: NavigationEnum.self) { route in
            route.view
                .environmentObject(viewModel)
                .environmentObject(navigation)
                
        }.task {
            do{
                categories = try await viewModel.fetchCategories() ?? []
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
    var catogeryCollection: some View{
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(categories.indices, id: \.self){ index in
                        CatogeryCell(name: categories[index].name, isActive: selectedIndex == index, nameSpace: menuItemTransition)
                            .onTapGesture{
                                    self.selectedIndex = index
                                Task{
                                    do{
                                        try await viewModel.fetchProducts(categoryId: "\(categories[index].id)")
                                    }catch{
                                        print(error.localizedDescription)
                                    }
                                }
                            }
                            .onChange(of: selectedIndex) { newValue in
                                withAnimation{
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
        .animation(.easeOut, value: selectedIndex)
        
    }
    
    var verticalCollection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ForEach(viewModel.productsArray, id: \.self){ product in
                    
                    VerticalCell(product: product)
                        .onTapGesture {
                            print("\n", product)
                            viewModel.selectedProduct = product
                            navigation.navigate(to: .details)
                        
//                            data.product = product
                            
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
