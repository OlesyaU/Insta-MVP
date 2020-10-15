//
//  FeedViewInputProtocol.swift
//  Course2FinalTask
//
//  Created by Олеся on 15.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation

protocol FeedViewInputProtocol: class {
    // Presenter -> View
    func setupInitialState()
    func setPosts(_ objects: [FeedCellObject])
}
protocol FeedCellDelegate {
    func postImageDoubleTapped(_ post: FeedCellObject)
    var dobTap:((Int, Bool) -> Void)? {get set}
    
}
protocol FeedViewOutputProtocol: class {
    // View -> Presenter
    
    var title: String { get }
    func viewIsReady()
    func postImageDoubleTapped(_ post: FeedCellObject)
    var doubleTappedLike: ((Int, Bool)-> Void)? { get set }
    var dob:((_ post: FeedCellObject)-> Void)? { get set }
}
