//
//  ContentView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
       
        // Burası kullanıcı önceden giriş yaptıysa direk ana ekrana döndürür.
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            
        
            MainPageView()
            
        
            
        }else{
            LoginView()
        }
        
       
    }
}

#Preview {
    MainView()
}
