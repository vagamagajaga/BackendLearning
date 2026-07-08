//
//  AuthorResponse.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 08.07.2026.
//

import Vapor

struct AuthorResponse: Content {
    let id: Int?
    let fullName: String
    let birthYear: Int
    let deathYear: Int?
}

extension AuthorResponse {
    init(_ author: DBAuthor) {
        self.id = author.id
        self.fullName = author.fullName
        self.birthYear = author.birthYear
        self.deathYear = author.deathYear
    }
}
