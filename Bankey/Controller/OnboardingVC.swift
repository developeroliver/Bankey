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
        
        let page1 = UIViewController()
        page1.view.backgroundColor = UIColor.red
        let page2 = UIViewController()
        page2.view.backgroundColor = UIColor.green
        let page3 = UIViewController()
        page3.view.backgroundColor = UIColor.blue
        
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
