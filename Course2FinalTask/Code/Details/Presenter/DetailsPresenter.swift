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

class DetailsPresenter {
    
   private let model: DetailsModel
    weak var cell: DetailsCell?
    
    init(model: DetailsModel) {
        self.model = model
    }
    
    
    
}
extension DetailsPresenter: DetailsOutputProtocol {
    
    
    var title: String {
//        тут возможно надо сделать свич для перехода и заголовка с энамом типа тайплист заголовков
        return "Details"
    }
    func viewIsReadyFollowing() {
        let objects = model.following.map{
            DetailsObject(avatar: $0.avatar, userName: $0.username)
        }
        
        cell?.configure(objects)
    }
    
    func viewIsReadyFollowers() {
        
        let objects = model.followers.map {
            DetailsObject(avatar: $0.avatar, userName: $0.username)
        }
        cell?.configure(objects)
    }
}
