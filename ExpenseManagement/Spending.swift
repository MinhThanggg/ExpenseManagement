//
//  Spending.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/30/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class Spending {
    private var money:Double
    private var category:Category?
    private var note:String
    private var image:UIImage?
    
    init?(money:Double, category:Category?, note:String, image:UIImage?) {
        self.money = money
        self.category = category
        self.note = note
        self.image = image
    }
    func getMoney()->Double {
        return money
    }
    func getCategory()->Category? {
        return category
    }
    func getNote()->String {
        return note
    }
    func getImage()->UIImage? {
        return image
    }
}
