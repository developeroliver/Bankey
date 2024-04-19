//
//  HeaderView.swift
//  Bankey
//
//  Created by olivier geiger on 19/04/2024.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    // MARK: - UI Declaration
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bankey"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Good Morning"
        label.textColor = .white
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Oliver"
        label.textColor = .white
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "19 Avril 2024"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "sun.max.fill")
        iv.tintColor = .systemYellow
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel,
            nameLabel,
            dateLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - LifeCyle Methods
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


extension HeaderView {
    
    private func style() {
        backgroundColor = .systemBlue
    }
    
    
    private func layout() {
        addSubview(contentView)
        addSubview(stackView)
        addSubview(imageView)
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(144)
        }
        
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.width.equalTo(100)
        }
    }
    
}

