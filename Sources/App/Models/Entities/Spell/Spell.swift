import Foundation
import Vapor
import Fluent
import FluentMySQL

final class Spell: Content {
    var id: Int?
    
    var name: String
    var description: String
    var soundFile: String
    
    init(name: String, description: String, soundFile: String) {
        self.name = name
        self.description = description
        self.soundFile = soundFile
    }
}

extension Spell: MySQLModel {
    static var entity = "spell"
}

extension Spell: Migration {
    typealias Database = MySQLDatabase
    static func prepare(on conn: Spell.Database.Connection) -> EventLoopFuture<Void> {
        return Database.create(Spell.self, on: conn, closure: { builder in
            builder.field(for: \.id, isIdentifier: true)
            builder.field(for: \.name)
            builder.field(for: \.description, type: .text)
            builder.field(for: \.soundFile)
        })
    }
}

