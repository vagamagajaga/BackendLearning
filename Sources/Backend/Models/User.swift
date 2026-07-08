//
//  User.swift
//  BackendLearning
//
//  Created by Ваган Галстян on 04.07.2026.
//

import Foundation
import Vapor

struct CreateUserRequest: Content {
    let name: String
    let surname: String
}

struct User: Content {
    let id: Int
    let name: String
    let surname: String
}
