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
        print("\(String(describing: post?.currentUserLikesThisPost)) initial value from PRESENTER postImageDoubleTapped")
        print("\(String(describing: post?.likedByCount)) initial value from PRESENTER postImageDoubleTapped")
        var userBool: Bool
        let userLikesCount: Int!
        switch post!.currentUserLikesThisPost {
            case true:
//                post?.likedByCount -= 1
               userBool = DataProviders.shared.postsDataProvider.unlikePost(with: post!.id)
                userLikesCount = post?.likedByCount
            print("\(userBool) from PRESENTER postImageDoubleTapped")
               print("\(String(describing: userLikesCount)) from PRESENTER postImageDoubleTapped")
            default:
//                post?.likedByCount += 1
                userBool = DataProviders.shared.postsDataProvider.likePost(with: post!.id)
                   userLikesCount = post?.likedByCount
            print("\(userBool) from PRESENTER postImageDoubleTapped")
             print("\(String(describing: userLikesCount)) from PRESENTER postImageDoubleTapped")
               
        }
        doubleTappedLike?(userLikesCount, userBool)
        view?.setupInitialState()
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
