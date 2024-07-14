//
//  CartManager.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 6.06.2024.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []

    func addToCart(product: ProductsModel, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += quantity
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            cartItems.append(newItem)
        }
    }

    func removeFromCart(product: ProductsModel) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems.remove(at: index)
        }
    }

    func totalCost() -> Int {
        return cartItems.reduce(0) { $0 + $1.product.price * $1.quantity }
    }
}
