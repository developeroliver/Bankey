//
//  MainTabBarController.swift
//  Bankey
//
//  Created by olivier geiger on 19/04/2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [ createSearchNC(), createContactNC(), createFavoritesNC()]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func createSearchNC() -> UINavigationController {
        let SearchVC = HomeVC()
        SearchVC.tabBarItem = UITabBarItem(title: "Rechercher", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        return UINavigationController(rootViewController: SearchVC)
    }
    
    func createContactNC() -> UINavigationController {
        let contactVC = HomeVC()
        contactVC.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.fill"), tag: 2)
        
        return UINavigationController(rootViewController: contactVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = HomeVC()
        favoritesVC.tabBarItem = UITabBarItem(title: "Profil", image: UIImage(systemName: "person.fill"), tag: 3)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}

