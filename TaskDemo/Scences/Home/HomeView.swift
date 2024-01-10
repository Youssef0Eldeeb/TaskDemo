//
//  HomeView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace private var menuItemTransition
    
    let gridColumns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
//    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 10){
                headlineText(text: "Category")
                horizontalCollectionView
                headlineText(text: "Products")
                cardCollection
            }
            .navigationTitle("Home")
        }
        
        .onAppear{
            //            viewModel.fetchCategory()
        }
        
    }
    
    func headlineText(text: String) -> some View{
        Text(text)
            .font(.system(size: 20, weight: .bold, design: .default))
            .padding(.leading, 20)
    }
    
    var horizontalCollectionView: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach([1,2,3,4], id: \.self) { index in
                    NavigationLink {
                        DetailsView()
                    } label: {
                        HorizontalCell(title: "hello", description: "description", imageUrl: "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg")
                    }
                }
            }
        }
        .padding(.leading, 15)
        .frame(height: 250)
    }
    
    var cardCollection: some View{
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: gridColumns, content: {
                ForEach([1,2,3,4,5,4,4,4].indices, id: \.self){index in
                    CardCell()
                }
            })
        }
    }
    

}

#Preview {
    HomeView()
}
