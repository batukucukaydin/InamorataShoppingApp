//
//  HeaderView.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 29.05.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Image("Logo")
                .resizable()
                .frame(width: 300,height: 140)
                .padding(.top, 30)
        }.padding(.top, 100)
    }
}

#Preview {
    HeaderView()
}
