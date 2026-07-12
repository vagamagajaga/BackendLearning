//
//  DBBook.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 12.07.2026.
//

import Vapor
import Fluent

final class DBBook: Model, Content, @unchecked Sendable {
    static let schema: String = "books"
    
    @ID(custom: "id", generatedBy: .database)
    var id: Int?
    
    @Parent(key: "author_id")
    var author: DBAuthor

    @Field(key: "title")
    var title: String

    @Field(key: "publish_year")
    var publishYear: Int
    
    @OptionalField(key: "description")
    var description: String?
    
    init() {}
    
    init(
        id: Int? = nil,
        author: DBAuthor,
        title: String,
        publishYear: Int,
        description: String
    ) {
        self.id = id
        self.author = author
        self.title = title
        self.publishYear = publishYear
        self.description = description
    }
}
