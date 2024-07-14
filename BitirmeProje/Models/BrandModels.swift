//
//  BrandModels.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 31.05.2024.
//

import SwiftUI

// Kategori için kullanacağım.
struct BrandModel : Identifiable,Hashable {
    
    var id: UUID = .init()
    var title:String
    var icon:String
    
    }

var sampleBrands: [BrandModel] = [

    .init(title: "Hepsi", icon: ""),
    .init(title: "Elektronik", icon: "comp"),
    .init(title: "Giyim", icon: "tshirt"),
    .init(title: "Eşya", icon: "chair")


]
