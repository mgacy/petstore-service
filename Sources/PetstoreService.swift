//
//  PetstoreService.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public struct PetstoreService {
    /// Add a new pet to the store
    ///
    /// Add a new pet to the store
    ///
    /// - Remark: HTTP `POST /pet`.
    /// - Remark: Generated from `#/paths//pet/post(addPet)`.
    public var addPet: @Sendable (Pet) async throws -> Pet

    /// Update an existing pet
    ///
    /// Update an existing pet by Id
    ///
    /// - Remark: HTTP `PUT /pet`.
    /// - Remark: Generated from `#/paths//pet/put(updatePet)`.
    public var updatePet: @Sendable (Pet) async throws -> Pet

    /// Finds Pets by status
    ///
    /// Multiple status values can be provided with comma separated strings
    ///
    /// - Remark: HTTP `GET /pet/findByStatus`.
    /// - Remark: Generated from `#/paths//pet/findByStatus/get(findPetsByStatus)`.
    public var findPetsByStatus: @Sendable (PetStatusInput) async throws -> [Pet]

    /// Finds Pets by tags
    ///
    /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
    ///
    /// - Remark: HTTP `GET /pet/findByTags`.
    /// - Remark: Generated from `#/paths//pet/findByTags/get(findPetsByTags)`.
    public var findPetsByTags: @Sendable ([String]) async throws -> [Pet]

    /// Find pet by ID
    ///
    /// Returns a single pet
    ///
    /// - Remark: HTTP `GET /pet/{petId}`.
    /// - Remark: Generated from `#/paths//pet/{petId}/get(getPetById)`.
    public var getPetById: @Sendable(Int64) async throws -> Pet

    /// Deletes a pet
    ///
    /// delete a pet
    ///
    /// - Remark: HTTP `DELETE /pet/{petId}`.
    /// - Remark: Generated from `#/paths//pet/{petId}/delete(deletePet)`.
    public var deletePet: @Sendable (Int64) async throws -> Operations.deletePet.Output

    public init(
        addPet: @escaping @Sendable (Pet) async throws -> Pet,
        updatePet: @escaping @Sendable (Pet) async throws -> Pet,
        findPetsByStatus: @escaping @Sendable (PetStatusInput) async throws -> [Pet],
        findPetsByTags: @escaping @Sendable ([String]) async throws -> [Pet],
        getPetById: @escaping @Sendable (Int64) async throws -> Pet,
        deletePet: @escaping @Sendable (Int64) async throws -> Operations.deletePet.Output
    ) {
        self.addPet = addPet
        self.updatePet = updatePet
        self.findPetsByStatus = findPetsByStatus
        self.findPetsByTags = findPetsByTags
        self.getPetById = getPetById
        self.deletePet = deletePet
    }
}

public extension PetstoreService {
    static func live(
        serverURL: URL,
        configuration: Configuration = .init(),
        apiKey: String
    ) -> Self {
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport(),
            middlewares: [AuthenticationMiddleware(apiKey: apiKey)])

        return .init(
            addPet: { pet in
                let response = try await client.addPet(.init(body: .json(pet)))
                return try response.ok.body.json
            },
            updatePet: { pet in
                let response = try await client.updatePet(.init(body: .json(pet)))
                return try response.ok.body.json
            },
            findPetsByStatus: { status in
                let response = try await client.findPetsByStatus(.init(query: .init(status: status)))
                return try response.ok.body.json
            },
            findPetsByTags: { tags in
                let response = try await client.findPetsByTags(.init(query: .init(tags: tags)))
                return try response.ok.body.json
            },
            getPetById: { id in
                let response = try await client.getPetById(path: .init(petId: id))
                return try response.ok.body.json
            },
            deletePet: { id in
                let response = try await client.deletePet(.init(path: .init(petId: id)))
                return response
            }
        )
    }
}
