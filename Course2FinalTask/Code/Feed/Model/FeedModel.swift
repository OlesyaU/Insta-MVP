//
//  FeedModel.swift
//  Course2FinalTask
//
//  Created by Олеся on 08.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

 class FeedModel {
     typealias Result = ([Post]) -> Void

    var posts: [Post] {
        return DataProviders.shared.postsDataProvider.feed()
    }
    
    func posts(_ result: @escaping Result)  {
        result( DataProviders.shared.postsDataProvider.feed())
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//    var likesPostCount: Int {
//        return currentPost.likedByCount
//    }

//    var isLikedCorrentPOst: Bool {
//        return currentPost.currentUserLikesThisPost
//    }
//    func datePost() -> String {
//        let time = currentPost.createdTime
//       let formatter = DateFormatter()
//            formatter.timeStyle = .medium
//            formatter.dateStyle = .medium
//            formatter.doesRelativeDateFormatting = true
//            return formatter.string(from: time)
//        }
        
   
//    var likedPost: Bool {
//        return DataProviders.shared.postsDataProvider.post(with: currentPost.id)?.currentUserLikesThisPost ?? false
//    }
//    }

