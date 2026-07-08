//
//  AuthorsRoutes.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Vapor

struct AuthorsRoutes {
    func registerAuthorsRoutes(_ app: Application) {
        let controller = AuthorsController()

        app.get("authors") { req async throws in
            try await controller.getAuthors(req: req)
        }

        app.get("author", ":id") { req async throws in
            try await controller.getAuthor(req: req)
        }
    }
}
