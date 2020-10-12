//
//  ProfileViewInputProtocol.swift
//  Course2FinalTask
//
//  Created by Олеся on 15.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

protocol ProfileViewInputProtocol: class {
    func setUserPosts(images: [UIImage])
    func setUserInfo(avatar: UIImage, name: String, followers: String, following: String, title: String)
    func setVC() -> UIViewController
     
}
