//
//  TabBarView.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedIndex: Int
    private let tabbarItems: [TabBarItem] = [.init(name: "Home", imageName: "house"),.init(name: "Products", imageName: "tray.full") ]
    
    init(selectedIndex: Int) {
        UITabBar.appearance().isHidden = true
        self.selectedIndex = selectedIndex

    }
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedIndex) {
                HomeView()
                    .tag(0)
                ProductsView()
                    .tag(1)
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack{
                Spacer()
                CustomTabBar(tabBarItems: tabbarItems, selectedIndex: $selectedIndex)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TabBarView(selectedIndex: 0)
}
