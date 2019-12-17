//
//  NewPasswordViewController.swift
//  PasswordManager
//
//  Created by Anton Chernyshev on 14/12/2019.
//  Copyright © 2019 an.chernyshev. All rights reserved.
//

import UIKit

class NewPasswordViewController: UITableViewController {
    
    let newPasswordArray: [String] = ["Name", "Login", "Password", "URL"]
    let comment: [String] = ["Add new comment"]
    let tag: [String] = ["Add your tag"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newPasswordArray.count
        } else if section == 1 {
            return comment.count
        } else {
            return tag.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .lightGray
        
        if indexPath.section == 0 {
            cell.textLabel?.text = newPasswordArray[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = comment[indexPath.row]
        } else {
            cell.textLabel?.text = tag[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    private func registerCell() {
        self.tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView.register(PasswordViewCell.self, forCellReuseIdentifier: "passwordCell")
    }
    
}
