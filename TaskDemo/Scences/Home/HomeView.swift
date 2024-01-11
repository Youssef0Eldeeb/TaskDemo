//
//  HomeView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace private var menuItemTransition
    @StateObject private var navigation = NavigationManager()
    @StateObject private var viewModel = HomeViewModel()
    
    let gridColumns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationStack(path: $navigation.routes) {
            VStack(alignment: .leading, spacing: 10){
                
                horizontalCollectionView
                headlineText(text: "Popular")
                cardCollection
            }
            .navigationDestination(for: NavigationEnum.self) { route in
                route.view
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
        .onAppear(perform: {
            viewModel.fetchHomeResponse()
        })
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
        .frame(height: 250)
    }
    private func HorizontalCell(banner: Banner) -> some View{
        AsyncImage(url: URL(string: banner.image ?? "https://student.valuxapps.com/storage/uploads/banners/1689107104Ezc0d.photo_2023-07-11_23-07-59.png"))
            .frame(width: 300, height: 250)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    var cardCollection: some View{
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: gridColumns, content: {
                ForEach(viewModel.popularProducts, id: \.self){product in
                    CardCell(product: product)
                        .onTapGesture {
                            navigation.navigate(to: .details)
                        }
                }
            })
        }
    }
    

}

#Preview {
    HomeView()
}
