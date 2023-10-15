//
//  FeatureReducer.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Common
import ComposableArchitecture
import Dependencies
import Foundation
import PetstoreService

public struct FeatureReducer: Reducer {
    public struct State: Equatable {
        public var error: AppError?
        public var isLoading = false
    }

    public enum Action: Equatable {
        case onAppear
    }

    @Dependency(\.petstoreService) var petstoreService

    public init() {}

    public func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .onAppear:
            return .none
        }
    }
}
