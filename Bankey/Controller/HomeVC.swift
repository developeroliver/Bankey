//
//  HomeVC.swift
//  Bankey
//
//  Created by olivier geiger on 18/03/2024.
//

import UIKit

class HomeVC: UIViewController {
    let stackView       = UIStackView()
    let label           = UILabel()
    let logoutButton    = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis      = .vertical
        stackView.spacing   = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text  = "Welcome"
        label.font  = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    
    private func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
        ])
    }

}


// MARK: - Action Button
extension HomeVC {
    
    @objc func logoutButtonTapped() {
        print("LOGOUT")
        logoutDelegate?.didLogout()
    }
}
