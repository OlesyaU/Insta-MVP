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
    
  var posts: [Post] {
        return DataProviders.shared.postsDataProvider.feed()
    }
    
   
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//    var likesPostCount: Int {
//        return currentPost.likedByCount
//    }

//    var isLikedCorrentPOst: Bool {
//        return currentPost.currentUserLikesThisPost
//    }

        
   
//    var likedPost: Bool {
//        return DataProviders.shared.postsDataProvider.post(with: currentPost.id)?.currentUserLikesThisPost ?? false
//    }
//    }

