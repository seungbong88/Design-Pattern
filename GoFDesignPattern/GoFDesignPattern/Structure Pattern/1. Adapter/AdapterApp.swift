//
//  Adapter App.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation

class AdapterApp {
    
    func start() {
        
        let myService = AccountService()
        myService.accounts = [
            Account(name: "Hello1", password: "password", email: "123@456.com"),
            Account(name: "Hello2", password: "password", email: "123@456.com"),
            Account(name: "Hello3", password: "password", email: "123@456.com"),
            Account(name: "Hello4", password: "password", email: "123@456.com"),
            Account(name: "Hello5", password: "password", email: "123@456.com"),
            Account(name: "Hello6", password: "password", email: "123@456.com")
        ]
        
        let otherUserServiceAdaptor = OtherUserServiceAdapter(accountService: myService)
        let loginHandler = LoginHandler(otherUserService: otherUserServiceAdaptor)
        
        do {
            try loginHandler.login(userName: "Hello4", userPassword: "password")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
