//
//  BigButtonView.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 29.05.2024.
//

import SwiftUI

struct BigButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action,label:{
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.white)
                Text(title)
                    .foregroundStyle(.black)
            }
        })
        .frame(height: 50)
        .padding(.horizontal)
    }
}

#Preview {
    BigButton(title: "String", action: {})
}
