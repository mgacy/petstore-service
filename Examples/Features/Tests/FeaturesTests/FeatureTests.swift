//
//  FeatureTests.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//
//

@testable import Feature
import ComposableArchitecture
import XCTest

@MainActor
final class FeatureTests: XCTestCase {
    func testOnAppear() async {
        let store = TestStore(initialState: FeatureReducer.State()) {
            FeatureReducer()
        }

        await store.send(.onAppear)
    }
}
