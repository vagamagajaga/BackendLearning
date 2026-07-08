//
//  AuthorsController.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Vapor

actor AuthorsController {
    
    let service = AuthorsService()
    
    func getAuthors(req: Request) async throws -> [AuthorResponse] {
        try await service.getAuthors(search: req.authorSearchText, on: req.db)
    }

    func getAuthor(req: Request) async throws -> AuthorResponse {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }

        return try await service.getAuthor(id: id, on: req.db)
    }
}

private extension Request {
    var authorSearchText: String? {
        guard let search = try? query.get(String.self, at: "search") else {
            return nil
        }

        let trimmed = search.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
    }
}
