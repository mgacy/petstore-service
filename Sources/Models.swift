//
//  Models.swift
//
//
//  Created by Mathew Gacy on 10/14/23.
//  
//

import Foundation

public typealias Address = Components.Schemas.Address

public typealias Category = Components.Schemas.Category

public typealias Customer = Components.Schemas.Customer

public typealias Order = Components.Schemas.Order

public typealias Pet = Components.Schemas.Pet

public typealias Tag = Components.Schemas.Tag

public typealias User = Components.Schemas.User

public typealias ApiResponse = Components.Schemas.ApiResponse // ?

// MARK: - Request Bodies

public typealias PetInput = Components.RequestBodies.Pet

public typealias Users = Components.RequestBodies.UserArray
