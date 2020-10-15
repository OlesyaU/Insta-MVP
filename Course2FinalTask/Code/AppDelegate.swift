//
//  AppDelegate.swift
//  Course2FinalTask
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        addControllers()
        return true
    }
}

extension AppDelegate {
    func addControllers() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = AppTabBarController()
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
