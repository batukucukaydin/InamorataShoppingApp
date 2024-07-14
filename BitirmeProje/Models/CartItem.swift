//
//  CartItem.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 2.06.2024.
//

import SwiftUI

struct CartItem: Identifiable, Hashable {
    var id: String {product.id}
    var product: ProductsModel
    var quantity: Int
}
