//
//  ProfileModel.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

struct ProfileModel {

    var currentUser: User {
        return DataProviders.shared.usersDataProvider.currentUser()
    }
    
    var currentUserPosts: [Post]? {
        return DataProviders.shared.postsDataProvider.findPosts(by: currentUser.id)
    }
    
    var userName: String {
       return DataProviders.shared.usersDataProvider.currentUser().username
    }
   
    var followers: [User]{
       return DataProviders.shared.usersDataProvider.usersFollowingUser(with: currentUser.id) ?? []
    }
    
    var follows: [User] {
        return DataProviders.shared.usersDataProvider.usersFollowedByUser(with: currentUser.id) ?? []
    }
}
