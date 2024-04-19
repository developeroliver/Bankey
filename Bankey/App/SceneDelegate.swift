//
//  SceneDelegate.swift
//  Bankey
//
//  Created by olivier geiger on 17/04/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let walkthroughController = WalkthroughVC()
        let navigationController = UINavigationController(rootViewController: walkthroughController)
        
        if !UserDefaults.standard.bool(forKey: "hasViewedWalkthrough") {
            window?.rootViewController = navigationController
        } else {
            let mainTabBarController = MainTabBarController()
            window?.rootViewController = UINavigationController(rootViewController: mainTabBarController)
        }
        
        
        window?.makeKeyAndVisible()
    }
    
}

