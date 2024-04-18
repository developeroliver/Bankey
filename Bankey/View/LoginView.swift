//
//  LoginView.swift
//  Bankey
//
//  Created by olivier geiger on 18/04/2024.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LoginView {
    
    private func style() {
        backgroundColor = .systemPink
    }
    
    
    private func layout() {
        
    }
    
}

