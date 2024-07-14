//
//  ProductManager.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 11.06.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProductManager: ObservableObject {
    @Published var products: [ProductsModel] = []

    private var db = Firestore.firestore()

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        db.collection("PRODUCTS").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.products = querySnapshot?.documents.compactMap { document -> ProductsModel? in
                    try? document.data(as: ProductsModel.self)
                } ?? []
            }
        }
    }
}
