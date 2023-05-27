//
//  User.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/27/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import UIKit

class User {
    private var email:String
    private var password:String
    private var username:String
    private var money:Double
    private var avatar:UIImage?
    
    init?(email:String, password:String, username:String, money:Double, avatar:UIImage?) {
        
        self.email = email
        self.password = password
        self.username = username
        self.money = money
        self.avatar = avatar
    }
    
    public func getEmail() -> String {
        return email
    }
    
    public func getPassword() -> String {
        return password
    }
    public func getUsername()->String {
        return username
    }
    public func getMoney()->Double {
        return money
    }
    public func getAvatar()->UIImage? {
        return avatar
    }
}
