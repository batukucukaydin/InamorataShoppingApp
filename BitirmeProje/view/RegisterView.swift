//
//  RegisterView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct RegisterView: View {
    
  @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                // Başlık
                HeaderView()
                
                // Hata Mesaj kısmı
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                // Kayıt Formu
                Form{
                    Section(header: Text("Kayıt ol")){
                        TextField("Tam adınız", text: $viewModel.name)
                            .autocorrectionDisabled()
                        TextField("Email adresiniz", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Şifreniz", text: $viewModel.password)
                        
                    }
                    
                }.scrollContentBackground(.hidden)
                    .frame(height: 250)
                
                BigButton(title: "Üye Ol", action: {
                    viewModel.register()
                    
                })
                Spacer()
                //Footer
                
                VStack{
                    Text("Zaten üye misin?")
                        .foregroundColor(.white)
                        
                    NavigationLink("**Hadi giriş yap!**", destination: LoginView())
                        .foregroundColor(.white)
                        
                        
                }
                
            }

            
        } .background(Gradient(colors: gradientColors))
        

    
    }

}

#Preview {
    RegisterView()
}
