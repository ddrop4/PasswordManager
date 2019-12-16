//
//  ViewController.swift
//  PasswordManager
//
//  Created by an.chernyshev on 10/12/2019.
//  Copyright © 2019 an.chernyshev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemOrange
        addLeftButton()
        addRightButton()
        tableViewSettings()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
    }
    
    // MARK: - Properties
    
    let myArray: [String] = ["Github", "Gitlab", "VK", "Mail.ru"]
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = myArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cell.imageView?.image = UIImage(named: "icon")
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // MARK: - Private methods
    
    private func tableViewSettings() {
        self.tableView = UITableView.init(frame: .zero, style: .plain)
        self.tableView.backgroundColor = .white
    }
    
    private func addLeftButton() {
        let label = UILabel()
        label.text = "PASSWORDS"
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .systemBlue
        let leftBarButton = UIBarButtonItem(customView: label)
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
    }
    
    private func addRightButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushToNewController))
        rightBarButton.tintColor = .systemBlue
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
    
    @objc private func pushToNewController() {
        let pushVC = NewPasswordViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    private func registerCell() {
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
}
