//
//  ProfileProtocols.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation

protocol ProfileInputProtocol: NSObject {
    // Presenter -> View
}

protocol ProfileCellDelegate: NSObject{
    
}
protocol ProfileOutputProtocol: NSObject {
    // View -> Presenter
}

protocol ProfilePresenterProtocol: class {
    var postCount: Int? { get }
    init(model: ProfileModel, controller: ProfileViewInputProtocol)
func showUserInfo()
//   func showPost() -> [UIImage]
//    func showVC() -> UIViewController
    }

protocol ProfileViewInputProtocol: class {
//    func setUserPosts(images: [UIImage])
//    func setUserInfo(avatar: UIImage, name: String, followers: String, following: String, title: String)
//    func setVC() -> UIViewController
     
}
