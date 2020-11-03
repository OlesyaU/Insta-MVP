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
//    weak var detView: DetailsInputProtocol?
    weak var view: FeedViewInputProtocol?
    private let model: FeedModel
    var doubleTappedLike: ((Int, Bool)-> Void)?
    var likesLabelTapped: (([DetailsObject]) -> Void)?
    var headerTapped: ((ProfileHeaderObject, [ProfileCellObject]) -> Void)?
    
    init(model: FeedModel) {
        self.model = model
    }
}

// MARK: - FeedViewOutputProtocol
extension FeedPresenter: FeedViewOutputProtocol {
   
    func headerTapped(_ post: FeedCellObject) {
//        let post = model.posts.first{
//            $0.id == post.postId as! Post.Identifier
//        }
        
        let profile = ProfileModel()
        let currentUserID = profile.currentUser.id
        let userPostID = post.userID
        if userPostID as! User.Identifier == currentUserID {
            let objectForProf = ProfileHeaderObject(fullName: profile.currentUser.fullName, followers: profile.followers.count, following: profile.follows.count, avatar: profile.currentUser.avatar, userName: profile.userName, userId: currentUserID)
            
            let arr = profile.currentUserPosts.map{
                ProfileCellObject(image: $0.image)
            }
            //            headerTapped(objectForProf, arr)
        }
    }
    
    func likeLabelTapped(_ post: FeedCellObject) {
        if  let post = model.posts.first(where: { $0.id == post.postId as! Post.Identifier}) {
            guard let users = DataProviders.shared.postsDataProvider.usersLikedPost(with: post.id) else {return}
            
            let array: [DetailsObject] = users.compactMap {
                let object = DataProviders.shared.usersDataProvider.user(with: $0)
                return  DetailsObject(avatar: object?.avatar, userName: object?.username ?? "username", userID: object?.id ?? "Id")
            }
            likesLabelTapped?(array)
            print(" func likeLabelTapped(_ post: FeedCellObject) из презентера")
        }
    }
    
    func postImageDoubleTapped(_ post: FeedCellObject) {
        if let post = model.posts.first(where: { $0.id == post.postId as! Post.Identifier }) {
            var userBool = post.currentUserLikesThisPost
            var userLikesCount = post.likedByCount
            switch userBool {
                case true:
                    userBool = DataProviders.shared.postsDataProvider.unlikePost(with: post.id)
                    userLikesCount = DataProviders.shared.postsDataProvider.usersLikedPost(with: post.id)!.count
                    userBool.toggle()
                default:
                    userBool = DataProviders.shared.postsDataProvider.likePost(with: post.id)
                    userLikesCount = DataProviders.shared.postsDataProvider.usersLikedPost(with: post.id)!.count
                
            }
            print("\(String(describing: userBool)) \(String(describing: userLikesCount)) в конце метода ")
            doubleTappedLike?(userLikesCount, userBool)
        }
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

