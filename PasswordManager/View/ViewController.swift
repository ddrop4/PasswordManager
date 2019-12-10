//
//  ViewController.swift
//  PasswordManager
//
//  Created by an.chernyshev on 10/12/2019.
//  Copyright © 2019 an.chernyshev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemOrange
        addLeftButton()
        addRightButton()
    }
    
    func addLeftButton() {
        let label = UILabel()
        label.text = "PASSWORDS"
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.textColor = .darkGray
        let leftBarButton = UIBarButtonItem(customView: label)
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
    }
    
    func addRightButton() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushToNewController))
        rightBarButton.tintColor = .darkGray
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
    
    @objc func pushToNewController() {
        let pushVC = AddNewViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func navBarSettings() {
        //
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
