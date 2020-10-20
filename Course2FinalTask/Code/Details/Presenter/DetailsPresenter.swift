//
//  DetailsPresenter.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

typealias PiCtuRe = UIImage

class DetailsPresenter: NSObject {
    
   private let model: DetailsModel
    weak var view: DetailsInputProtocol?
    
    init(model: DetailsModel) {
        self.model = model
    }
    
    
    
}
extension DetailsPresenter: DetailsOutputProtocol {
    func viewIsReadyFollowing() {
        view?.setupInitialState()
        let following = model.following.map{
            DetailsObject(avatar: $0.avatar, userName: $0.username, userID: $0.id)
        }
        view?.setUsers(following)
    }
    
    
    
    var title: String {
//        тут возможно надо сделать свич для перехода и заголовка с энамом типа тайплист заголовков
        return "Details"
    }
   
func viewIsReadyFollowers() {
        view?.setupInitialState()
        let followers = model.followers.map {
            DetailsObject(avatar: $0.avatar, userName: $0.username, userID: $0.id)
        }
        view?.setUsers(followers)
       
    }
    
}
