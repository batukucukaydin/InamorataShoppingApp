//
//  LoginViewViewModel.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 29.05.2024.
//

import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}

    // Giriş Fonksiyonu
    func login(){
        guard validate() else{
            return
            
        }
     
        }
    
    // E mail kontrolu
    func validate() -> Bool{
       
        errorMessage = ""
       
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty
       else{
           errorMessage = "Lütfen tüm alanları doldurunuz"
           return false
       }
       
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "Geçerli bir mail adresi giriniz."
           return false
       }
       
        
        return true
        }
}
