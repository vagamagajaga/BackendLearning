//
//  DBAuthor.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 06.07.2026.
//

import Vapor
import Fluent

final class DBAuthor: Model, Content, @unchecked Sendable {
    static let schema: String = "authors"
    
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Field(key: "full_name")
    var fullName: String

    @Field(key: "birth_year")
    var birthYear: Int

    @Field(key: "death_year")
    var deathYear: Int?
    
    init() {}
    
    init(
        id: Int? = nil,
        fullName: String,
        birthYear: Int,
        deathYear: Int? = nil
    ) {
        self.id = id
        self.fullName = fullName
        self.birthYear = birthYear
        self.deathYear = deathYear
    }
}
