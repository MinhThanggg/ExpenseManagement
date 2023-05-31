//
//  Category.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/29/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class Category {
    private var name:String
    private var image:UIImage?
    
    init?(name:String, image:UIImage?) {
        self.name = name
        self.image = image
    }
    
    func getName()->String {
        return name
    }
    func getImage()->UIImage? {
        return image
    }
}
