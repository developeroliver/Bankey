//
//  SceneDelegate.swift
//  Bankey
//
//  Created by olivier geiger on 17/03/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let loginVC         = LoginVC()
    let onboardingVC    = OnboardingContainerViewController()
    let homeVC          = HomeVC()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        loginVC.delegate        = self
        onboardingVC.delegate   = self
        homeVC.logoutDelegate   = self
                
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }
}


// MARK: - LoginVCDelegate
extension SceneDelegate: LoginVCDelegate {
    func didLogin() {
        setRootViewController(onboardingVC)
    }
}

extension SceneDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        setRootViewController(homeVC)
    }
}

extension SceneDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginVC)
    }
}

extension SceneDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil)
    }
    
    
}

