//
//  AuthorsRoutes.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Vapor

struct AuthorsRoutes {
    func registerUserRoutes(_ app: Application) {
        
        let controller = AuthorsController()

        app.get("authors") { req async throws in
            try await controller.getAuthors(req: req)
        }
    }
}
