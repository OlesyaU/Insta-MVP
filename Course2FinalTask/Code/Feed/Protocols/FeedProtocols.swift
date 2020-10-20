//
//  FeedViewInputProtocol.swift
//  Course2FinalTask
//
//  Created by Олеся on 15.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation

protocol FeedViewInputProtocol: NSObject {
    // Presenter -> View
    func setupInitialState()
    func setPosts(_ objects: [FeedCellObject])
}
protocol FeedCellDelegate {
    func postImageDoubleTapped(_ post: FeedCellObject)
    func likeLabelTapped(_ post: FeedCellObject)
    func headerTapped(_ post: FeedCellObject)
     func profileTap()
}
protocol FeedViewOutputProtocol: NSObject {
    // View -> Presenter
    
    var title: String { get }
    func viewIsReady()
    func postImageDoubleTapped(_ post: FeedCellObject)
    var doubleTappedLike: ((Int, Bool)-> Void)? { get set }
    func likeLabelTapped(_ post: FeedCellObject)
    var likesLabelTapped: (([Any]) -> Void)? { get set }
    func headerTapped(_ post: FeedCellObject)
      var headerTapped: ((ProfileHeaderObject, [ProfileCellObject]) -> Void)? { get set }
}

