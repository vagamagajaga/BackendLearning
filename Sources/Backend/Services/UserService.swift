//
//  UserService.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 04.07.2026.
//

import Vapor

actor UserService {
    
    private var users: [Int: User] = [:]

    func getUser(id: Int) async throws -> User {
        guard let user = users[id] else {
            throw Abort(.notFound)
        }
        
        return user
    }

    func createUser(with user: CreateUserRequest) -> User {
        let id = provideId()
        let user = User(
            id: id,
            name: user.name,
            surname: user.surname
        )
        users[id] = user
        
        return user
    }
}

private extension UserService {
    func provideId() -> Int {
        var id = 0
        
        while users[id] != nil {
            id += 1
        }
        
        return id
    }
}
