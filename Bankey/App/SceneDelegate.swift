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
        UINavigationBar.appearance().backgroundColor = .systemBlue
        
        let walkthroughController = WalkthroughVC()
        
        if !UserDefaults.standard.bool(forKey: "hasViewedWalkthrough") {
            window?.rootViewController = walkthroughController
        } else {
            let mainTabBarController = MainTabBarController()
            window?.rootViewController = mainTabBarController
        }
        
        
        
        window?.makeKeyAndVisible()
    }
    
}

