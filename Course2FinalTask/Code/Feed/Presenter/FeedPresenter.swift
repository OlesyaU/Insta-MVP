//
//  FeedPresenter.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

typealias Picture = UIImage

final class FeedPresenter: NSObject {
    
    weak var view: FeedViewInputProtocol?
    private let model: FeedModel
    var doubleTappedLike: ((Int, Bool)-> Void)?

    init(model: FeedModel) {
        self.model = model
    }
}

// MARK: - FeedViewOutputProtocol
extension FeedPresenter: FeedViewOutputProtocol {
    
  func postImageDoubleTapped(_ post: FeedCellObject) {
        let post = model.posts.first{ $0.id == post.postId as! Post.Identifier}
        
        var userBool = post?.currentUserLikesThisPost
        var userLikesCount = post?.likedByCount
    
        switch userBool {
            case true:
                userBool = DataProviders.shared.postsDataProvider.unlikePost(with: post!.id)
                userBool?.toggle()
                userLikesCount! -= 1
            default:
                userBool = DataProviders.shared.postsDataProvider.likePost(with: post!.id)
                userLikesCount! += 1
        }
        doubleTappedLike?(userLikesCount!, userBool!)
    }
    
    var title: String {
        return "Feed"
    }
    
    func viewIsReady() {
        view?.setupInitialState()
        
        let postsArray: [FeedCellObject] = model.posts.map {
            FeedCellObject(userAvatar: $0.authorAvatar, userName: $0.authorUsername, datePost: makeFormattedDate(post: $0.createdTime), likesCount: $0.likedByCount, description: $0.description, isliked: $0.currentUserLikesThisPost, imagePost: $0.image, postId: $0.id, userID: $0.author)
        }
        
        view?.setPosts(postsArray)
    }
    
    private func makeFormattedDate(post: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        
        return formatter.string(from: post)
    }
}
