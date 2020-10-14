//
//  AppTabbarDelegate.swift
//  Course2FinalTask
//
//  Created by Олеся on 05.09.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit


class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([buildFeedModule(), buildProfileModule()], animated: true)
    }
    
    private func buildFeedModule() -> UINavigationController {
        let presenter = FeedPresenter(model: FeedModel())
        
        let feedView = FeedViewController()
        feedView.output = presenter
        
        let feedNavigationController = UINavigationController(rootViewController: feedView)
        presenter.view = feedView
        
        feedNavigationController.tabBarItem.image = #imageLiteral(resourceName: "feed")
        
        return feedNavigationController
    }
    
    private func buildProfileModule() -> UINavigationController {
        let presenter = ProfilePresenter(model: ProfileModel())
        
        let profileViewController = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        profileViewController.presenter = presenter
        
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        presenter.controller = profileViewController
        
        profileViewController.tabBarItem.image = #imageLiteral(resourceName: "profile")
        profileViewController.title = "Profile"
        return profileNavigationController
    }
}
