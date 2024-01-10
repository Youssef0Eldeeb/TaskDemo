//
//  DetailsView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            VStack(spacing: -35){
                upperView
                buttomView
            }//: VStack
            .ignoresSafeArea( edges: .top)
            .padding(.horizontal, -1)
            
            dataCenterView
        }//: ZStack
        .navigationBarBackButtonHidden(true)
    }
    
    
    private var upperView: some View{
        ZStack {
            AsyncImage(url: URL(string: ""))
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
    private var buttomView: some View{
        ZStack {
            descriptionView
            
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
    
    private var descriptionView: some View{
        ScrollView{
            Text("news.description")
                .padding(.top)
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3 + 20)
        .padding()
        .padding(.top, 70)
        .background()
        .lineLimit(.max)
        .roundedCorner(30, corners: [.topLeft, .topRight])
    }
    
    private var dataCenterView: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("news.publishedAt")
                .font(.footnote)
            Text("news.title")
                .fontDesign(.serif)
                .font(.headline)
                .lineLimit(3)
            Text("Published by " + ("news.author"))
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
    DetailsView()
}
