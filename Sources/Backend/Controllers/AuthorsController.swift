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
        try await service.getAuthors(on: req.db)
    }

    func getAuthor(req: Request) async throws -> AuthorResponse {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }

        return try await service.getAuthor(id: id, on: req.db)
    }
}
