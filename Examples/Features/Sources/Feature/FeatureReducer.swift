//
//  FeatureReducer.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Common
import ComposableArchitecture
import Foundation

public struct FeatureReducer: Reducer {
    public struct State: Equatable {
        public var error: AppError?
        public var isLoading = false
    }

    public enum Action: Equatable {
        case onAppear
    }

    public func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .onAppear:
            return .none
        }
    }
}
