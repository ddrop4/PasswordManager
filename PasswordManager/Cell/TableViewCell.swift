//
//  TableViewCell.swift
//  PasswordManager
//
//  Created by an.chernyshev on 11/12/2019.
//  Copyright © 2019 an.chernyshev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.accessoryType = .none
    }
    
}
