//
//  HomeView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace private var menuItemTransition
    @StateObject private var viewModel = HomeViewModel()
    
    let gridColumns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 10){
                
                horizontalCollectionView
                headlineText(text: "Popular")
                cardCollection
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AppRouter.shared.logout()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .fontWeight(.bold)
                    }

                }
            }
        }
        .task {
            do{
                try await viewModel.fetchHomeResponse()
            }catch{
                print(error.localizedDescription)
            }
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
                ForEach(viewModel.banners, id: \.self) { banner in
                    HorizontalCell(banner: banner)
                }
            }
        }
        .padding(.leading, 15)
        .frame(height: 260)
    }
    private func HorizontalCell(banner: Banner) -> some View{
        AsyncImage(url: URL(string: banner.image ?? "https://student.valuxapps.com/storage/uploads/banners/1689107104Ezc0d.photo_2023-07-11_23-07-59.png"))
            .frame(width: 300, height: 250)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 2)
            .padding(.vertical)
    }
    
    var cardCollection: some View{
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: gridColumns, content: {
                ForEach(viewModel.popularProducts, id: \.self){product in
                    NavigationLink {
                        DetailsView(product: product)
                    } label: {
                        CardCell(product: product)
                    }
                }
            })
            .padding(10)
        }
    }
    

}

#Preview {
    HomeView()
}
