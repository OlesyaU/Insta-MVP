//
//  DetailsProtocols.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation

protocol DetailsInputProtocol{
//    Presenter - View
      func setupInitialState()
}


protocol DetailsOutputProtocol{
    // View -> Presenter
    var title: String { get }
    func viewIsReadyFollowing()
    func viewIsReadyFollowers()
    
}
//protocol ProfileInputProtocol: NSObject {
//    // Presenter -> View
//    func setupInitialState()
//    func setPosts(_ posts: [ProfileCellObject])
//    func setHeader(_ header: ProfileHeaderObject)
//}
//
//protocol ProfileCellDelegate: NSObject {
//
//}
//protocol ProfileOutputProtocol: NSObject {
//    // View -> Presenter
//    var title: String { get }
//    func viewIsReady()
//}
