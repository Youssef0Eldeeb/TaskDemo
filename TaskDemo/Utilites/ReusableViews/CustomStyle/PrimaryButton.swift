//
//  PrimaryButton.swift
//  TaskDemo
//
//  Created by Youssef Eldeeb on 07/01/2024.
//

import SwiftUI

enum ButtonSize{
    case large, mediam
    
    var height: CGFloat{
        switch self{
        case .large: 60
        case .mediam: 48
        }
    }
}


struct PrimaryButton: ButtonStyle{
    
    let buttonSize: ButtonSize
    var icon: ImageResource?
    
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Spacer()
            if let icon{
                Image(icon)
                    .font(.system(size: 40, weight: .light))
            }
            configuration.label
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
        .font(.system(buttonSize == .mediam ? .title3 : .title2, design: .rounded, weight: .bold))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: buttonSize.height)
        .background(Color.primaryButton)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .opacity(configuration.isPressed ? 0.5 : 1)
        .saturation(isEnabled ? 1 : 0)
    }
}

extension ButtonStyle where Self == PrimaryButton{
    static func customButtonStyle(size: ButtonSize = .large, icon: ImageResource? = nil) -> Self {
        PrimaryButton(buttonSize: .large, icon: icon)
    }
}
