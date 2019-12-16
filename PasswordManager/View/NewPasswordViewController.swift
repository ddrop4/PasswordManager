//
//  NewPasswordViewController.swift
//  PasswordManager
//
//  Created by Anton Chernyshev on 14/12/2019.
//  Copyright © 2019 an.chernyshev. All rights reserved.
//

import UIKit

class NewPasswordViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 53
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    private func registerCell() {
        self.tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView.register(PasswordViewCell.self, forCellReuseIdentifier: "passwordCell")
    }
    
}
