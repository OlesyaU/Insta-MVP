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
            headerTapped!(objectForProf, arr)
        }
    }
    
    func likeLabelTapped(_ post: FeedCellObject) {
//         let post = model.posts.first{ $0.id == post.postId as! Post.Identifier}
        let likers = DataProviders.shared.postsDataProvider.usersLikedPost(with: post.postId as! Post.Identifier)
        guard let likerS = likers else {return}
        print(likerS)
        
//        if  likesLabelTapped != nil {
//            likesLabelTapped!(likerS)
            let nbhy = likerS.compactMap {
                DataProviders.shared.usersDataProvider.user(with: $0)
//                DetailsObject(avatar: nhjjn.avatar, userName: nhjjn.username, userID: nhjjn.id)
            }
      likesLabelTapped!(nbhy)
        }
        
        
//    }
    
    
  func postImageDoubleTapped(_ post: FeedCellObject) {
     let post = model.posts.first{ $0.id == post.postId as! Post.Identifier}
    print(post?.currentUserLikesThisPost)
      print(post?.likedByCount)
    var userBool = post?.currentUserLikesThisPost
    var userLikesCount = post?.likedByCount

    switch post?.currentUserLikesThisPost {
            case true:
                 
                DataProviders.shared.postsDataProvider.unlikePost(with: post!.id)
                DataProviders.shared.postsDataProvider.usersLikedPost(with: post!.id)?.count
                userBool?.toggle()
                userLikesCount! -= 1
              print(post?.currentUserLikesThisPost)
                print(post?.likedByCount)
        
//    print(userBool)
            default:
              DataProviders.shared.postsDataProvider.likePost(with: post!.id)
               DataProviders.shared.postsDataProvider.usersLikedPost(with: post!.id)?.count
//                userBool =
                userLikesCount! += 1
                print(post?.currentUserLikesThisPost)
          print(post?.likedByCount)
//        зкште(Э\(гыукИщщд) 'nj .pth,ek bp afkcf@)
        }
      print(post?.currentUserLikesThisPost)
      print(post?.likedByCount)
          print("\(userBool) \(userLikesCount ) это в конце метода ")
//        doubleTappedLike?(userLikesCount!, userBool!)
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
    private func checkPost(_ post: FeedCellObject) -> Bool {
        if model.posts.first(where: { $0.id == post.postId as! Post.Identifier}) != nil {
        return true
        } else {return false}
    }
}
