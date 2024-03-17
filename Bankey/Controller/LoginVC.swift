//
//  LoginVC.swift
//  Bankey
//
//  Created by olivier geiger on 17/03/2024.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginView       = LoginView()
    let signInButton    = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
    }


    private func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


// MARK - Actions Button
extension LoginVC {
    
    @objc func signInTapped() {
        print("SIGN IN TAPPED")
    }
}
