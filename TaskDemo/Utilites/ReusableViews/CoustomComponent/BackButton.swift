//
//  BackButton.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 08/01/2024.
//

import SwiftUI

struct BackButton<Label: View> : View {
    var action: () -> Void
    var label: Label
    
    init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }
    
    var body:some View {
        
        Button {
            action()
        } label: {
            Image(systemName: "chevron.backward")
                .padding(10)
                .padding(.horizontal, 5)
                .font(.title3.bold())
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 15).foregroundColor(.accentColor.opacity(0.8))
                )
        }
        .padding()

    }
}


#Preview{
    BackButton(action: {}, label: {})
}
