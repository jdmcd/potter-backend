//
//  PaginatedSpellResponse.swift
//  App
//
//  Created by Jimmy McDermott on 11/11/18.
//

import Foundation
import Vapor

struct PaginatedSpellResponse: Content {
    let results: [Spell]
}
