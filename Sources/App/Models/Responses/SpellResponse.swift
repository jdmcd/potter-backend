//
//  PaginatedSpellResponse.swift
//  App
//
//  Created by Jimmy McDermott on 11/11/18.
//

import Foundation
import Vapor

struct SpellResponse: Content {
    let results: [Spell]
    
    struct Spell: Content {
        let id: Int
        let name: String
        let description: String
        let soundFile: String
        let url: String
        
        init(spell: App.Spell) throws {
            id = try spell.requireID()
            name = spell.name
            description = spell.description
            soundFile = spell.soundFile
            url = "https://potterspells.herokuapp.com/api/v1/spell/\(id)"
        }
    }
}
