//
//  CreateBook.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 12.07.2026.
//

import Fluent

struct CreateBook: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("books")
            .field("id", .int, .identifier(auto: true))
            .field("author_id", .int, .required, .references("authors", "id") )
            .field("title", .string, .required)
            .field("publish_year", .int, .required)
            .field("description", .string)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("books").delete()
    }
}
