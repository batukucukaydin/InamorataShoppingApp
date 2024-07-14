//
//  ProfileView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){}
    
    @State private var username: String = "John Doe"
    @State private var email: String = "johndoe@example.com"
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Image and Name
                VStack {
                    
                    if let user = viewModel.user{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color("GradientTop"))
                            .padding(.top, 50)
                        
                        Text(user.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("GradientTop"))
                        
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    else{
                        Text("Profil Yükleniyor...")
                    }
                    
                    
                }
                .padding(.bottom, 50)
                
                // Settings
                List {
                    NavigationLink(destination: Text("Edit Profile View")) {
                        HStack {
                            Image(systemName: "pencil.circle.fill")
                                .foregroundColor(Color("GradientTop"))
                            Text("Edit Profile")
                        }
                    }
                    
                    NavigationLink(destination: Text("Favorites View")) {
                        HStack {
                            Image(systemName: "star.circle.fill")
                                .foregroundColor(Color("GradientTop"))
                            Text("Favorites")
                        }
                    }
                    
                    NavigationLink(destination: Text("Settings View")) {
                        HStack {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color("GradientTop"))
                            Text("Settings")
                        }
                    }
                }
                
                // Logout Button
                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Çıkış")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 30)
            }
            .navigationTitle("Profile")
            .navigationBarHidden(true)
            
            .onAppear{
                viewModel.fetchUser()
                
            }
            
            
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
