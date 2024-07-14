//
//  RegisterViewViewModel.swift
//  BitirmeProje
//
//  
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
     init(){}
    
    func register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result,
            error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
            
            
        }
        
    }
    
    // Firestore da kullanıcı oluşturmaya yarayan fonksiyon-Kullanıcın login hariç isim,ödeme bilgisi gibi diğer bilgilerini saklamaya yarar. !!!!! Çalışmıyorrr
     private func insertUserRecord(id: String){
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictonary())
        
    }
 
        
        private func validate() -> Bool{
            errorMessage = ""
            guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                  !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else{
                errorMessage = "Lüften tüm alanları doldurunuz"
                return false
            }
            
            guard email.contains("@") && email.contains(".") else{
                errorMessage = "Geçerli bir email adresi giriniz"
                return false
            }
            
            guard password.count >= 6 else {
                errorMessage = "Lütfen en az 6 karakter içiren bir şifre giriniz"
                return false
            }
            
            // Bu mesaj güzelleştirilebilir(!)
            errorMessage = "Başarılı bir şekilde üye oldunuz!"
            return true
        }
    
}
