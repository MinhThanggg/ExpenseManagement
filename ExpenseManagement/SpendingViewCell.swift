//
//  SpendingViewCell.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/30/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class SpendingViewCell: UITableViewCell {

    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var lbCategoryName: UILabel!
    @IBOutlet weak var lbMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
