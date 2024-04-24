//
//  AccountSummaryVC.swift
//  Bankey
//
//  Created by olivier geiger on 18/04/2024.
//

import UIKit
import SnapKit

class AccountSummaryVC: UITableViewController {
    
    // MARK: - Properties
    struct Profile {
        var firstname: String
        let lastname: String
    }
    
    var profile: Profile!
    var accounts: [AccountSummaryCell.ViewModel] = []
    
    // MARK: - UI
    private lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .white
        return barButtonItem
    }()
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let savedUsername = UserDefaults.standard.string(forKey: "username") {
                profile = AccountSummaryVC.Profile(firstname: savedUsername, lastname: "")
            }
        style()
        setupTableView()
        setupTableHeaderView()
        fetchData()
        setupNavigationBar()
        
    }
}

// MARK: - @objec Functions
extension AccountSummaryVC {
    
    @objc func logoutTapped() {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}

// MARK: - Helpers
extension AccountSummaryVC {
    
    func configure(username: String) {
        profile?.firstname = username
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.backgroundColor = .systemBlue
        tableView.tableFooterView = UIView()
        self.tableView = tableView
    }
    
    private func setupTableHeaderView() {
        let header = HeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        self.tableView.tableHeaderView = header
        if let firstname = profile?.firstname {
            header.configure(viewModel: HeaderView.ViewModel(welcomeMessage: "Bonjour", name: firstname, date: Date.now))
        } else {
            // Gérer le cas où profile est nul
            header.configure(viewModel: HeaderView.ViewModel(welcomeMessage: "Bonjour", name: "Utilisateur", date: Date.now))
        }
    }
}

// MARK: - DataSource and Delegate
extension AccountSummaryVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
}

extension AccountSummaryVC {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                   accountName: "Basic Savings",
                                                   balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                    accountName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                accountName: "Visa Avion Card",
                                                balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                      accountName: "Student Mastercard",
                                                      balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Tax-Free Saver",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Growth Fund",
                                                       balance: 15000.00)
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}


extension AccountSummaryVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ["CB", "Factures", "Courses"][row] // Remplacer les options par les vôtres
    }
}
