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
    let games = ["Pacman", "Space Invaders", "Space Patrol"]
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setupTableView()
        setupTableHeaderView()
    }
    
}

// MARK: - Helpers
extension AccountSummaryVC {
    
    private func style() {
        view.backgroundColor = .systemBackground
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
    }
}

// MARK: - DataSource and Delegate
extension AccountSummaryVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        return cell
    }
}

