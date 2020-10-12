//
//  FeedPresenter.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

final class FeedPresenter: NSObject {
    
    weak var view: FeedViewInputProtocol?
    
    private let model: FeedModel
    
    init(model: FeedModel) {
        self.model = model
    }
}

// MARK: - FeedViewOutputProtocol
extension FeedPresenter: FeedViewOutputProtocol {
    var title: String {
        return "Feed"
    }
    
    func viewIsReady() {
        view?.setupInitialState()
        
        let postsArray: [FeedCellObject] = model.posts.map {
            FeedCellObject(
                userAvatar: $0.authorAvatar,
                userName: $0.authorUsername,
                datePost: $0.createdTime.description,
                likesCount: $0.likedByCount,
                description: $0.description,
                isliked: $0.currentUserLikesThisPost,
                imagePost: $0.image
            )
        }
        
        view?.setPosts(postsArray)
    }
}
