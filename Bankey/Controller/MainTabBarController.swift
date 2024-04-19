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
        let SearchVC = AccountSummaryVC()
        SearchVC.tabBarItem = UITabBarItem(title: "Summary", image: UIImage(systemName: "list.dash.header.rectangle"), tag: 1)
        
        return UINavigationController(rootViewController: SearchVC)
    }
    
    func createContactNC() -> UINavigationController {
        let contactVC = MoreVC()
        contactVC.tabBarItem = UITabBarItem(title: "Move Money", image: UIImage(systemName: "arrow.left.arrow.right"), tag: 2)
        
        return UINavigationController(rootViewController: contactVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = MoveMoneyVC()
        favoritesVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle"), tag: 3)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}

