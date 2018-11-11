import Foundation
import Vapor

final class PotterController: RouteCollection {
    func boot(router: Router) throws {
        let build = router.grouped("/api/v1/")
        build.get("spells", use: allSpells)
        build.get("spell", Spell.parameter, use: spell)
    }
   
    func allSpells(req: Request) throws -> Future<SpellResponse> {
        return Spell.query(on: req).all().map { spells in
            return try SpellResponse(results: spells.map { try SpellResponse.Spell(spell: $0) } )
        }
    }
    
    func spell(req: Request) throws -> Future<Spell> {
        return try req.parameters.next(Spell.self)
    }
}
