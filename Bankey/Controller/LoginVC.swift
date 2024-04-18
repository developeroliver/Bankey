//
//  LoginVC.swift
//  Bankey
//
//  Created by olivier geiger on 17/04/2024.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Declarations
    private let loginView = LoginView()
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    
}

// MARK: - @objc Functions

// MARK: - Helpers
extension LoginVC {
    
    private func setup() {
        view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
    }
}
