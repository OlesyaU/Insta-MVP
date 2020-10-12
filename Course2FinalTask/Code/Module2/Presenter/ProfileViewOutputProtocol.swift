//
//  ProfileViewOutputProtocol.swift
//  Course2FinalTask
//
//  Created by Олеся on 15.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

protocol ProfilePresenterProtocol: class {
    var postCount: Int? { get }
    init(model: ProfileModel, controller: ProfileViewInputProtocol)
func showUserInfo()
   func showPost() -> [UIImage]
    func showVC() -> UIViewController
    }


