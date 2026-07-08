//
//  SeedAuthors.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 06.07.2026.
//

import Fluent

struct SeedAuthors: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.transaction { db in
            
            try await DBAuthor(
                fullName: "Эрих Мария Ремарк",
                birthYear: 1898,
                deathYear: 1970
            )
            .save(on: db)
            
            try await DBAuthor(
                fullName: "Харуки Мураками",
                birthYear: 1949,
                deathYear: nil
            )
            .save(on: db)
        }
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await DBAuthor.query(on: database)
            .filter(\.$fullName ~~ "Эрих Мария Ремарк")
            .delete()
        
        try await DBAuthor.query(on: database)
            .filter(\.$fullName ~~ "Харуки Мураками")
            .delete()
    }
}
