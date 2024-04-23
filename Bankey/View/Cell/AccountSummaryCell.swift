//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by olivier geiger on 22/04/2024.
//

import UIKit
import SnapKit

class AccountSummaryCell: UITableViewCell {
    
    // MARK: - Properties
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
    enum AccountType: String {
            case Banking
            case CreditCard
            case Investment
        }
        
        struct ViewModel {
            let accountType: AccountType
            let accountName: String
            let balance: Decimal
            
            var balanceAsAttributedString: NSAttributedString {
                return CurrencyFormatter().makeAttributedCurrency(balance)
            }
        }
        
        let viewModel: ViewModel? = nil
    
    // MARK: - UI
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Account Type"
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.sizeToFit()
        return label
    }()
    
    let dividerView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Account name"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Some Balance"
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")!.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            balanceLabel,
            balanceAmountLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    // MARK: - LifeCycle Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Helpers
extension AccountSummaryCell {
    
    private func setup() {
        backgroundColor = .systemBackground
        
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "XXX,XXX", cents: "XX")
    }
    
    private func layout() {
        contentView.addSubview(typeLabel)
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(16)
        }
        
        contentView.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.equalTo(4)
            make.width.equalTo(60)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
        }
        
        contentView.addSubview(chevronImageView)
        chevronImageView.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(0)
            make.bottom.equalTo(contentView.snp.bottom)
            make.trailing.equalTo(chevronImageView.snp.trailing).offset(-24)
        }
        
        
    }
}

// MARK: - SetupBalance
extension AccountSummaryCell {
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

extension AccountSummaryCell {
    func configure(with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsAttributedString
        
        switch vm.accountType {
        case .Banking:
            dividerView.backgroundColor = .systemBlue
            balanceLabel.text = "Current Balance"
        case .CreditCard:
            dividerView.backgroundColor = .systemOrange
            balanceLabel.text = "Current balance"
        case .Investment:
            dividerView.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
        }
    }
}

