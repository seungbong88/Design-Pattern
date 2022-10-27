//
//  OtherUserServiceAdapter.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation



/// OtherUserInfo 인터페이스를 사용할 수 있도록 연결해주는 어댑터  (AccountService -> OtherUserService)
class OtherUserServiceAdapter: OtherUserService {
    var allUsers: [OtherUser] = []
    
    let service: AccountService
    
    init(accountService: AccountService) {
        self.service = accountService
    }
    
    func loadUser(userName: String) -> OtherUser? {
        if let account = service.findAccountByUserName(userName: userName) {
            return OtherUserAdapter(account: account)
        }
        return nil
    }
}
