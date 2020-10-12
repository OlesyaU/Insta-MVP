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
        self.tabBar.barTintColor = .purple
        
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
    
    private func buildProfileModule() -> ProfileViewController {
        let profileViewController = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())
        profileViewController.tabBarItem.image = #imageLiteral(resourceName: "profile")
        profileViewController.title = "Profile"

        return profileViewController
    }
}
