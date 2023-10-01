//
//  Extensions.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/7/23.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String: Any]{
        
        guard let data  = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return[:]
        }
    }
}

