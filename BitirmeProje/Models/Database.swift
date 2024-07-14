//
//  Database.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 12.06.2024.
//

import SwiftUI
import FirebaseFirestore

class Database: ObservableObject{

    @Published var productList = [ProductsModel]()
    
    init() {
        getProducts()
    }
    
    func getProducts(){
        
        let db = Firestore.firestore()
        
        db.collection("PRODUCTS").addSnapshotListener{snapshot, error in
            if let snapshot = snapshot {
                for document in snapshot.documents{
                    self.productList.append(
                        ProductsModel(
                            id: document.documentID,
                            title: document.get("title") as! String,
                            brand: document.get("brand") as! String,
                            description: document.get("description") as! String,
                            images: document.get("images") as! [String],
                            sizes: document.get("sizes") as! [Int],
                            price: document.get("price") as! Int))
                }
            }
            
        }
        
        
        
        
        
    }
    
    
    
}