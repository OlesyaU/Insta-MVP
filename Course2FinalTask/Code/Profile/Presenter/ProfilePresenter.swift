//
//  ProfilePresenter.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

class ProfilePresenter: NSObject {
    
    let model: ProfileModel
  weak  var  controller: ProfileInputProtocol?
   
    required init(model: ProfileModel) {
        self.model = model

       }
    }

extension ProfilePresenter: ProfileOutputProtocol {
    
    func viewIsReady() {
        controller?.setupInitialState()
        let arrayPostImage: [ProfileCellObject] = model.currentUserPosts.map{
            ProfileCellObject(image: $0.image)
        }
        let modelUser = model.currentUser
        let user = ProfileHeaderObject(fullName: modelUser.fullName, followers: modelUser.followedByCount, following: modelUser.followsCount, avatar: modelUser.avatar, userName: modelUser.username)
        
        controller?.setHeader(user)
        controller?.setPosts(arrayPostImage)
        }
    
    var title: String {
        return "Profile"
    }
    
}
