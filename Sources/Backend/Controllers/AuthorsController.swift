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
}
