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
        addSaveBtn()
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
    
    private func addSaveBtn() {
        let view = UIView()
        print(Y)
        let window = UIWindow()
        let btnX = (window.frame.size.width / 2) - 40
        let btnY = window.frame.size.height
        print(btnY)
        let saveBtn = UIButton(type: .custom)
        saveBtn.frame = CGRect(x: btnX, y: btnY, width: 80, height: 35)
        saveBtn.titleLabel?.text = "Save"
        saveBtn.titleLabel?.textColor = .white
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.backgroundColor = .systemBlue
        view.addSubview(saveBtn)
    }

}
