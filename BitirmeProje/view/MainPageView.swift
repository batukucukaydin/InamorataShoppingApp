//
//  MainPageView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        TabView{
            // Alt  Sekme
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Ana Sayfa")
                }
                .toolbarBackground(.visible, for: .tabBar)
                //.toolbarBackground(ThinMaterial, for: .tabBar)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Ara")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Sepet")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .environmentObject(CartManager())
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
        }
        .tint(Color("GradientTop"))
    }
}

#Preview {
    MainPageView()
}
