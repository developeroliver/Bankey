//
//  WalkthroughVC.swift
//  Bankey
//
//  Created by olivier geiger on 18/04/2024.
//

import UIKit
import SnapKit

class WalkthroughVC: UIPageViewController {
    
    // MARK: - Properties
    var currentIndex = 0
    var pageHeadings = ["Bankey est plus rapide, plus facile à utiliser et a une toute nouvelle apparence qui vous donnera l'impression d'être revenu dans les années 80.", "Déplacez votre argent dans le monde entier rapidement et en toute sécurité.", "Pour en savoir plus, consultez le site www.bankey.com."]
    var pageImages = ["delorean", "thumbs", "world"]
    
    // MARK: - UI Declarations
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray6
        return pageControl
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("Précédent", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Suivant", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        updateUI()
    }
}

// MARK: - @objc Functions
extension WalkthroughVC {
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        currentIndex = sender.currentPage
        updateUI()
    }
    
    @objc private func previousButtonTapped(_ sender: UIButton) {
        currentIndex = max(currentIndex - 1, 0)
        updateUI()
    }
    
    @objc private func nextButtonTapped(_ sender: UIButton) {
        
        switch currentIndex {
        case 0..<2:
            currentIndex += 1
            updateUI()
        case 2:
            print("ok")
            let navigation = LoginVC()
            navigationController?.pushViewController(navigation, animated: true)
            navigationController?.setViewControllers([navigation], animated: false)
            UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
            UserDefaults.standard.synchronize()
            
        default:
            break
        }
    }
}

// MARK: - Helpers
extension WalkthroughVC {
    
    private func updateUI() {
        imageView.image = UIImage(named: pageImages[currentIndex])
        titleLabel.text = pageHeadings[currentIndex]
        pageControl.currentPage = currentIndex
        previousButton.isHidden = currentIndex == 0
        nextButton.setTitle(currentIndex == 2 ? "Terminer" : "Suivant", for: .normal)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(pageControl)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        
        pageControl.numberOfPages = 3
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        previousButton.addTarget(self, action: #selector(previousButtonTapped(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(220)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
        
        previousButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
