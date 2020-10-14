//
//  DetailsModel.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

final class DetailsModel {
    
    var user: User {
        return DataProviders.shared.usersDataProvider.currentUser()
    }
    var followers: [User] {
        return DataProviders.shared.usersDataProvider.usersFollowingUser(with: user.id) ?? []
    }
    var following: [User] {
        return DataProviders.shared.usersDataProvider.usersFollowedByUser(with: user.id) ?? []
    }
    
}
