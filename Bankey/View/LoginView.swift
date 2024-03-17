//
//  LoginView.swift
//  Bankey
//
//  Created by olivier geiger on 17/03/2024.
//

import UIKit

class LoginView: UIView {
    
    let stackView           = UIStackView()
    let usernameTextfield   = UITextField()
    let divider             = UIView()
    let passwordTextfield   = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func style() {
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis     = .vertical
        stackView.spacing  = 10
        
        layer.cornerRadius  = 5
        clipsToBounds       = true
        
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.placeholder    = "Nom d'utilisateur"
        usernameTextfield.delegate       = self
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .secondarySystemFill
        
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder    = "Mot de passe"
        passwordTextfield.delegate       = self
    }
    
    
    func layout() {
        // addSubview
        addSubview(stackView)
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordTextfield)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
