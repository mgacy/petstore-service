//
//  AppError.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Foundation

public struct AppError: Identifiable, Equatable, Error {
    public let id: UUID
    public let reason: String
    public let underlyingError: Error?

    public init(id: UUID, reason: String, underlyingError: Error? = nil) {
        self.id = id
        self.reason = reason
        self.underlyingError = underlyingError
    }

    public static func == (lhs: AppError, rhs: AppError) -> Bool {
        lhs.id == rhs.id && lhs.reason == rhs.reason
    }
}
