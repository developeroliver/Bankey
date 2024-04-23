//
//  LoginView.swift
//  Bankey
//
//  Created by olivier geiger on 18/04/2024.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - UI Declarations
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            usernameTextField,
            dividerView,
            passwordTextField,
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Entrer un nom d'utilisateur"
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Entrer votre mot de passe"
        tf.isSecureTextEntry = true
        tf.enablePasswordToggle()
        return tf
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
        
    // MARK: - LifeCycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension LoginView {
    
    private func style() {        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
