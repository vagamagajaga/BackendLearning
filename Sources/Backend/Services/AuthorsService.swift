//
//  File.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Fluent
import Vapor

struct AuthorsService {
    
    func getAuthors(search: String?, on database: Database) async throws -> [AuthorResponse] {
        let query = DBAuthor.query(on: database)
            .sort(\.$id)

        if let search {
            query.filter(\.$fullName ~~ "%\(search)%")
        }

        let authors = try await query
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
