//
//  File.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Fluent
import Vapor

struct AuthorsService {
    
    func getAuthors(on database: Database) async throws -> [AuthorResponse] {
        let authors = try await DBAuthor.query(on: database)
            .sort(\.$id)
            .all()

        return authors.map(AuthorResponse.init)
    }

    func getAuthor(id: Int, on database: Database) async throws -> AuthorResponse {
        guard let author = try await DBAuthor.find(id, on: database) else {
            throw Abort(.notFound)
        }
        
        return AuthorResponse(author)
    }
}
