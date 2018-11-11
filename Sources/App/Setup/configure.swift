import FluentMySQL
import Vapor

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // MARK: -  Register database providers first
    try services.register(FluentMySQLProvider())
    
    // MARK: -  Register routes to the router
    services.register(Router.self) { container -> EngineRouter in
        let router = EngineRouter.default()
        try routes(router, container)
        return router
    }

    // MARK: -  Register the databases
    services.register { container -> DatabasesConfig in
        var databaseConfig = DatabasesConfig()
        try databases(config: &databaseConfig)
        return databaseConfig
    }
    
    services.register { _ -> MiddlewareConfig in
        var middlewares = MiddlewareConfig()
        try middleware(config: &middlewares)
        return middlewares
    }
    
    // MARK: -  Call the migrations
    services.register { container -> MigrationConfig in
        var migrationConfig = MigrationConfig()
        try migrate(migrations: &migrationConfig)
        return migrationConfig
    }
    
    // MARK: -  Command Config
    services.register { _ -> CommandConfig in
        var commandConfig = CommandConfig.default()
        commands(config: &commandConfig)
        return commandConfig
    }    
}
