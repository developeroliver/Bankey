//
//  OnboardingVC.swift
//  Bankey
//
//  Created by olivier geiger on 18/03/2024.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    
    var pageViewController: UIPageViewController!
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createPageViewController()
        setupPageControl()
    }
    
    func createPageViewController() {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        
        let page1 = OnboardingVC(heroImageName: "delorean", titleText: "Bankey est plus rapide, plus facile à utiliser et a une toute nouvelle apparence qui vous donnera l'impression d'être revenu en 1989.")
        let page2 = OnboardingVC(heroImageName: "world", titleText: "Déplacez votre argent dans le monde entier rapidement et en toute sécurité.")
        let page3 = OnboardingVC(heroImageName: "thumb", titleText: "Pour en savoir plus, consultez le site www.bankey.com.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        pageController.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
        pageViewController = pageController
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = .secondarySystemBackground
        appearance.currentPageIndicatorTintColor = .systemBlue
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        return pages[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < pages.count else {
            return nil
        }
        return pages[nextIndex]
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = pageViewController.viewControllers?.first,
              let firstViewControllerIndex = pages.firstIndex(of: firstViewController) else {
            return 0
        }
        return firstViewControllerIndex
    }
}
