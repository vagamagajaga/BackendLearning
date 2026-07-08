//
//  File.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Foundation

struct AuthorsService {
    
    func getAuthors() async throws -> [DBAuthor] {
        app.get("authors") { req async throws -> [DBAuthor] in
            try await DBAuthor.query(on: req.db).all()
        }
    }
}
