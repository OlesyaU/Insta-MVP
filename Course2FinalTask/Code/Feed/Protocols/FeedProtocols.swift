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
    
}
protocol FeedViewOutputProtocol: class {
    // View -> Presenter
    
    var title: String { get }
    func viewIsReady()
    func postImageDoubleTapped(_ post: FeedCellObject)
}
