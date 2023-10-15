//
//  DependencyValues+Dependencies.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Dependencies
import Foundation
import PetstoreService

public extension DependencyValues {
    var petstoreService: PetstoreService {
        get { self[PetstoreService.self] }
        set { self[PetstoreService.self] = newValue }
    }
}
