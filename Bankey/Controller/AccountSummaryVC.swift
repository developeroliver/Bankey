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
    let reuseID = "CELL_ID"
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.rowHeight = 50
        self.tableView = tableView
    }
    
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        self.tableView.tableHeaderView = header
    }
}

// MARK: - DataSource and Delegate
extension AccountSummaryVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
                return cell
    }
}

