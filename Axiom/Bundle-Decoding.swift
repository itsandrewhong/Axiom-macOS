//
//  Bundle-Decoding.swift
//  Axiom
//
//  Created by Andrew Hong on 9/12/20.
//  Copyright © 2020 Raonpia. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        
        // Cannot locate file
        guard let url = self.url(forResource: file, withExtension: nil)
            else {
                fatalError("Failed to locate \(file) in app bundle.")
        }
        
        // Cannot load file
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        //  Cannot decode file
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from app bundle.")
            
        }
        
        return loaded
    }
}
