//
//  OtherUserAdapter.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation


class OtherUserAdapter: OtherUser { // Account -> OtherUser
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    func getUserName() -> String {
        return account.name
    }
    
    func getUserPassword() -> String {
        return account.password
    }
}
