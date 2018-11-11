import Vapor
import FluentMySQL

public func migrate(migrations: inout MigrationConfig) throws {
    migrations.add(model: Spell.self, database: .mysql)
}
