//
//  User.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 29.05.2024.
//

import Foundation

struct User: Codable{
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
