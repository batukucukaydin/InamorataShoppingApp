//
//  MainViewViewModel.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 29.05.2024.
//
import FirebaseAuth
import Foundation


class MainViewViewModel:ObservableObject{
    
    @Published var currentUserId: String = ""
    
    //  Login olunmuşmu database den kontrol
    init(){
        
        Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        
      }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
}
