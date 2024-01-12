//
//  DetailsView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.dismiss) var dismiss

    let product: Product
    
    var body: some View {
        ZStack {
            VStack(spacing: -35){
                upperView(with: product)
                buttomView(product: product)
            }//: VStack
            .ignoresSafeArea( edges: .top)
            .padding(.horizontal, -1)
            
            dataCenterView(product: product)
        }//: ZStack
        .navigationBarBackButtonHidden(true)
    }
    
    
    private func upperView(with product: Product) -> some View{
        ZStack {
            AsyncImage(url: URL(string: product.image ?? ""), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {})
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                .scaledToFill()
            VStack{
                backButoonView
                Spacer()
            }
            .padding()
            .padding(.top, 30)
        }
    }
    private func buttomView(product: Product) -> some View{
        ZStack {
            descriptionView(product: product)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    favoriteButton
                }//: HStack
                .padding()
            }//: VStack
            .padding()
        }//: ZStack
    }
    
    private func descriptionView(product: Product) -> some View{
        ScrollView{
            Text(product.description ?? "")
                .padding(.top)
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3 + 20)
        .padding()
        .padding(.top, 70)
        .background()
        .lineLimit(.max)
        .roundedCorner(30, corners: [.topLeft, .topRight])
    }
    
    private func dataCenterView(product: Product) -> some View{
        VStack(alignment: .leading, spacing: 10){
            Text(product.name ?? "Product Name")
                .fontDesign(.serif)
                .font(.headline)
                .lineLimit(3)
            Text("Price: \(String(format: "%.2f", arguments: [product.price ?? 0.0]))")
                .font(.footnote.bold())
        }
        .frame(width: 280, height: 130)
        .padding()
        .background(Color.accentColor.opacity(0.8))
        .foregroundColor(.white)
        .cornerRadius(20)
        .offset(x: 0, y: -45)
    }
    
    private var backButoonView: some View {
        HStack{
            BackButton(action: {
                dismiss()
            }, label: {})
            Spacer()
        }
    }
    private var favoriteButton: some View {
        Button {
            //
        } label: {
            Image(systemName: "heart")
                .padding(15)
                .font(.title2.bold())
                .foregroundColor(.white)
                .background(Circle().foregroundColor(.accentColor.opacity(0.9)))
        }

    }
}

#Preview {
    DetailsView(product: .init(id: nil, price: 0.0, oldPrice: nil, discount: nil, image: "", name: "", description: "", images: nil, inFavorites: nil, inCart: nil))
}
