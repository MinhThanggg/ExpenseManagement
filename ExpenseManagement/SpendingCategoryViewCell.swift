//
//  SpendingCategoryViewCell.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/31/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class SpendingCategoryViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
