//
//  ProductsView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 09/01/2024.
//

import SwiftUI

struct ProductsView: View {
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
    }
    var catogeryCollection: some View{
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(["item1", "item2"].indices, id: \.self){ index in
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
                ForEach([1,2,3].indices, id: \.self){ index in
                    NavigationLink {
                        Details()
                    } label: {
                        VerticalCell(title: "hello", description: "description")
                    }

                    
                }
            }
        }
    }
    
}

#Preview {
    ProductsView()
}
