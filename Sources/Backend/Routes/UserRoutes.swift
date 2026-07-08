//
//  UserRoutes.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 04.07.2026.
//

import Vapor

struct UserRoutes {
    
    func registerUserRoutes(_ app: Application) {
        
        let controller = UserController()
        
        app.get("user", ":id") { req async throws in
            try await controller.getUser(req: req)
        }

        app.post("user") { req async throws in
            try await controller.createUser(req: req)
        }
    }
}
