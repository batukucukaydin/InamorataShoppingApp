//
//  ImageSlider.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 1.06.2024.
//

import SwiftUI

struct ImageSlider: View {
    
    var images: [String]
    
    var body: some View {
        TabView{
            ForEach(images,id: \.self){ img in
                AsyncImage(url: URL(string: img)){ Image in
                    Image.resizable()
                        .scaledToFill()
                    
                }placeholder: {
                    ProgressView()
                }
                
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}

