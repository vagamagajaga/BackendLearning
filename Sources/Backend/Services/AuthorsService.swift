//
//  File.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Fluent

struct AuthorsService {
    
    func getAuthors(on database: Database) async throws -> [AuthorResponse] {
        let authors = try await DBAuthor.query(on: database)
            .sort(\.$id)
            .all()

        return authors.map(AuthorResponse.init)
    }
}
