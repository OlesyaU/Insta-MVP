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
    let controller: ProfileViewInputProtocol
   
   required init(model: ProfileModel, controller: ProfileViewInputProtocol) {
        self.model = model
        self.controller = controller
       }
    }

extension ProfilePresenter: ProfilePresenterProtocol {
    var postCount: Int? {
        get {
            model.currentUserPosts?.count
        }
        }
    
    func showPost() -> [UIImage] {
        guard let posts = self.model.currentUserPosts else {return []}
        var images = [UIImage]()
        
        for i in posts {
            images.append(i.image)
        }
        
        self.controller.setUserPosts(images: images)
        return images
        }
   
    func showUserInfo() {
        let userName = self.model.currentUser.fullName
        guard let userAvatar = self.model.currentUser.avatar else {return}
        let followers = "Followers: \(self.model.currentUser.followedByCount)"
        let following = "Following: \(self.model.currentUser.followsCount)"
        let title = self.model.currentUser.username

        self.controller.setUserInfo(avatar: userAvatar, name: userName, followers: followers, following: following, title: title)
      }
    
    func showVC() -> UIViewController {
        let on = self.controller
        return on as! UIViewController
      
    }
}
