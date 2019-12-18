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
        setupSaveButton()
        dismissKeyboard()
        setupNavigationTitle()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath) as! PasswordViewCell
        let passwordField = UITextField(frame: CGRect(x: 20, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        passwordField.placeholder = "Text"
        
        cell.addSubview(passwordField)
        
        if indexPath.section == 0 {
            passwordField.placeholder = newPasswordArray[indexPath.row]
        } else if indexPath.section == 1 {
            passwordField.placeholder = comment[indexPath.row]
        } else {
            passwordField.placeholder = tag[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstTitle = "Add your comment"
        let secondTitle = "Add your tag"
        if section == 1 {
            return firstTitle
        } else if section == 2 {
            return secondTitle
        }
        return title
    }
    
    private func registerCell() {
        self.tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView.register(PasswordViewCell.self, forCellReuseIdentifier: "passwordCell")
    }
    
    private func setupSaveButton() {
        let window = UIWindow()
        let width = window.frame.size.width / 2 - 50
        let saveButton = UIButton(type: .custom)
        let customView = UIView(frame: CGRect(x: Int(width), y: 20, width: 100, height: 45))
        
        saveButton.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(actionSave), for: .touchUpInside)
        
        customView.addSubview(saveButton)
        self.tableView.tableFooterView = customView
    }
    
    @objc private func actionSave() {
        print(#function)
    }
    
    private func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setupNavigationTitle() {
        self.navigationItem.title = "Add password"
    }
    
}
