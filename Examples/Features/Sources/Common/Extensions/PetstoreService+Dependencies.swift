//
//  PetstoreService+Dependencies.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Dependencies
import PetstoreService
import XCTestDynamicOverlay

extension PetstoreService: DependencyKey {
    public static var liveValue: PetstoreService {
        .live(
            serverURL: try! Servers.server1(),
            apiKey: "xxxx")
    }
}

extension PetstoreService: TestDependencyKey {
    public static var testValue: PetstoreService {
        .init(
            addPet: unimplemented("\(Self.self).addPet"),
            updatePet: unimplemented("\(Self.self).updatePet"),
            findPetsByStatus: unimplemented("\(Self.self).findPetsByStatus"),
            findPetsByTags: unimplemented("\(Self.self).findPetsByTags"),
            getPetById: unimplemented("\(Self.self).getPetById"),
            deletePet: unimplemented("\(Self.self).deletePet")
        )
    }
}
