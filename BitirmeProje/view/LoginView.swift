//
//  LoginView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

let gradientColors : [Color] = [
    .gradientTop,
    .gradientBottom

]

struct LoginView: View {
   
  @StateObject var viewModel = LoginViewViewModel()
   
    
    var body: some View {
        NavigationStack{
            VStack{
                // Başlık
               HeaderView()
                //Hata mesajı kısmı
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                // Form Mail Şifre
                Form{
                    // Mail geçerliliği!!!
                    TextField("Email Adresiniz", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Sifreniz",text: $viewModel.password)
                        
                    
                    
                }
                .frame(height: 150)
                //.background(Color.white)
                .scrollContentBackground(.hidden)
                
                BigButton(title: "Giriş Yap") {
                    viewModel.login()
                }
               
                 Spacer()
                
                //Hesap açma alanı
                
                VStack{
                    Text("Yoksa üye değil misin?")
                        .foregroundColor(.white)
                    NavigationLink("**Hesap Oluştur!**", destination: RegisterView())
                        .foregroundColor(.white)
                
                        
                }
                
            }
            .background(Gradient(colors: gradientColors))
        }
    }

        
}

#Preview {
    LoginView()
}
