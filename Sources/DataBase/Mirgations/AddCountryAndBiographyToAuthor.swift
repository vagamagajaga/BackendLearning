//
//  AddCountryAndBiographyToAuthor.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 11.07.2026.
//

import Fluent

struct AddCountryAndBiographyToAuthor: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("authors")
            .field("country", .string)
            .field("biography", .string)
            .update()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("authors")
            .deleteField("country")
            .deleteField("biography")
            .update()
    }
}
