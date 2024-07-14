//
//  Extensions.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 30.05.2024.
//

import Foundation

extension Encodable{
    
    func asDictonary() -> [String:Any]{
        
        guard let data = try? JSONEncoder().encode(self) else{
            return[:]
        }
        
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
            
        }catch{
            return[:]
        }
    }
}
