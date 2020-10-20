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
    var likesLabelTapped: (([Any]) -> Void)?
    var headerTapped: ((ProfileHeaderObject, [ProfileCellObject]) -> Void)?
    
    init(model: FeedModel) {
        self.model = model
    }
}

// MARK: - FeedViewOutputProtocol
extension FeedPresenter: FeedViewOutputProtocol {
    
    
    
    func headerTapped(_ post: FeedCellObject) {
        let post = model.posts.first{
            $0.id == post.postId as! Post.Identifier
        }
        
        let profile = ProfileModel()
        let currentUserID = profile.currentUser.id
        let userPostID = post?.author
        if userPostID == currentUserID {
            let objectForProf = ProfileHeaderObject(fullName: profile.currentUser.fullName, followers: profile.followers.count, following: profile.follows.count, avatar: profile.currentUser.avatar, userName: profile.userName, userId: currentUserID)
            
            let arr = profile.currentUserPosts.map{
                ProfileCellObject(image: $0.image)
            }
            headerTapped!(objectForProf, arr)
        }
    }
    
    func likeLabelTapped(_ post: FeedCellObject) {
         let post = model.posts.first{ $0.id == post.postId as! Post.Identifier}
      var likers = DataProviders.shared.postsDataProvider.usersLikedPost(with: post!.id)
        guard let likerS = likers else {return}
       
        
        
        likesLabelTapped!([likerS])
        
    }
    
    
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
