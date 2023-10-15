//
//  AuthenticationMiddleware.swift
//  
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Foundation
import HTTPTypes
import OpenAPIRuntime
import OpenAPIURLSession

public extension HTTPField.Name {
    static var apiKey: Self {
        .init("api_key")!
    }
}

public struct AuthenticationMiddleware: ClientMiddleware {
    /// The API key.
    public var apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: @Sendable (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        var request = request
        request.headerFields[.apiKey] = apiKey

        let (response, body) = try await next(request, body, baseURL)
        // ...
        return (response, body)
    }
}
