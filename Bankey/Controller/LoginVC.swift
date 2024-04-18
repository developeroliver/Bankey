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
    private let loginView = LoginView()
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    // MARK: - UI Declarations
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.text = ""
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Votre source privilégiée pour tout ce qui touche à la banque!"
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Se connecter", for: .normal)
        return button
    }()
    
    private let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleAnimation()
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough") { return }
    }
}

// MARK: - @objc Functions
extension LoginVC {
    
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
}

// MARK: - Logic Functions
extension LoginVC {
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Utilisateur / mot de passe ne doit pas être nul")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Utilisateur / mot de passe ne peut être vide")
            return
        }
        
        if username == "" && password == "" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Utilisateur / mot de passe incorrect")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
    private func titleAnimation() {
        titleLabel.frame = CGRect(x: 0, y: -titleLabel.frame.size.height, width: view.frame.size.width, height: titleLabel.frame.size.height)
        titleLabel.text = "Bankey"
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.titleLabel.frame = CGRect(x: 0, y: 100, width: self.titleLabel.frame.size.width, height: self.titleLabel.frame.size.height)
        }, completion: nil)
    }
}

// MARK: - Helpers
extension LoginVC {
    
    private func setup() {
        view.backgroundColor = .systemBackground
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(subtitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-24)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginView.snp.top).offset(-24)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        loginView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(80)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(40)
        }
        
        errorMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
}
