//
//  AddNewViewController.swift
//  PasswordManager
//
//  Created by an.chernyshev on 10/12/2019.
//  Copyright © 2019 an.chernyshev. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let myCollectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        let cellSize = CGSize(width: 350, height: 80)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.minimumLineSpacing = 3.0
        layout.minimumInteritemSpacing = 3.0
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        myCollectionView.backgroundColor = .white
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        view.addSubview(myCollectionView)
    }
    
}
