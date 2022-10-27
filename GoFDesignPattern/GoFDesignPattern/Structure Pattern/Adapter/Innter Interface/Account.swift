//
//  Account.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation

class Account {
    var name: String
    var password: String
    var email: String
    
    init(name: String, password: String, email: String) {
        self.name = name
        self.password = password
        self.email = email
    }
}
