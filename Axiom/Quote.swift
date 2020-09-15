//
//  Quote.swift
//  Axiom
//
//  Created by Andrew Hong on 9/12/20.
//  Copyright © 2020 Raonpia. All rights reserved.
//

import Foundation

struct Quote: Codable {
    var text: String
    var author: String

    var shareMessage: String {
        return "\"\(text)\" — \(author)"
    }
}
