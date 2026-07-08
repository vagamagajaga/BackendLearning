//
//  CreateAuthor.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 06.07.2026.
//

import Fluent

struct CreateAuthor: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("authors")
            .field("id", .int, .identifier(auto: true))
            .field("full_name", .string, .required)
            .field("birth_year", .int, .required)
            .field("death_year", .int)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("authors").delete()
    }
}
