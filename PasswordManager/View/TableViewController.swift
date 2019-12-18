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

        addLeftButton()
        addRightButton()
        tableViewSettings()
        setupSaveButton()
        registerCell()
        setupSearchBar()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
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
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
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
    
    private func setupSaveButton() {
           let window = UIWindow()
           let width = window.frame.size.width / 2 - 50
           let saveButton = UIButton(type: .custom)
           let customView = UIView(frame: CGRect(x: Int(width), y: 20, width: 100, height: 45))
           
           saveButton.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
           saveButton.backgroundColor = .white
           saveButton.setTitle("Save", for: .normal)
           saveButton.setTitleColor(.systemBlue, for: .normal)
           saveButton.addTarget(self, action: #selector(actionSave), for: .touchUpInside)
           
           customView.addSubview(saveButton)
           self.tableView.tableFooterView = customView
       }
       
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchBar.sizeToFit()
    }
       
    @objc private func actionSave() {
        print(#function)
    }

}
