//
//  UserController.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 04.07.2026.
//

import Vapor

actor UserController {

    let service = UserService()

    func getUser(req: Request) async throws -> User {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }

        return try await service.getUser(id: id)
    }

    func createUser(req: Request) async throws -> User {
        let user = try req.content.decode(CreateUserRequest.self)
        return await service.createUser(with: user)
    }
}
