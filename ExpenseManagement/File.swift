//
//  File.swift
//  ExpenseManagement
//
//  Created by CNTT on 5/30/23.
//  Copyright © 2023 fit.tdc. All rights reserved.
//

import Foundation



struct UserAPI: Codable {
    let _id: String
    let username: String
    let password: String
    let createAt: String?
    let updateAt: String?
    let __v: Int
}
