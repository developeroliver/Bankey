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
        
        
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough") {
            let mainTabBarController = MainTabBarController()
            window?.rootViewController = mainTabBarController
        } else {
            window?.rootViewController = walkthroughController
        }
        
        registerForNotifications()
        
        window?.makeKeyAndVisible()
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    @objc private func didLogout() {
        let loginVC = LoginVC()
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        
        // Supprimer les données d'authentification enregistrées
        UserDefaults.standard.removeObject(forKey: "hasViewedWalkthrough")
        UserDefaults.standard.synchronize()
    }
    
}


