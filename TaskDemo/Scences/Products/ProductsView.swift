//
//  ProductsView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var viewModel = ProductsViewModel()
    @Namespace private var menuItemTransition
    @State var selectedIndex: Int = 0
    var categoryArray = ["Item1", "Item2", "Item3"]
    var body: some View {
        NavigationView{
            VStack{
                catogeryCollection
                verticalCollection
            }
            .navigationTitle("Products")
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
    var catogeryCollection: some View{
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(categoryArray.indices, id: \.self){ index in
                        CatogeryCell(name: categoryArray[index].capitalized, isActive: selectedIndex == index, nameSpace: menuItemTransition)
                            .onTapGesture{
                                withAnimation(.easeInOut) {
                                    self.selectedIndex = index
                                }
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
                ForEach(viewModel.productsArray.indices, id: \.self){ index in
                    NavigationLink {
                        DetailsView()
                    } label: {
                        VerticalCell(product: viewModel.productsArray[index])
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
