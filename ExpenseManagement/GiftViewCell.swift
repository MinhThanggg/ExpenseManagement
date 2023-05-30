//
//  GiftViewCell.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/30/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class GiftViewCell: UITableViewCell {

    @IBOutlet weak var imgExpense: UIView!
    @IBOutlet weak var expenseTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
	
        // Configure the view for the selected state
    }

}
