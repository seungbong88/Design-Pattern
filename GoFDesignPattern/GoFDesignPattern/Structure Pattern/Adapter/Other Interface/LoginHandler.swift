//
//  LoginHandler.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation

class LoginHandler {
    
    enum LoginError: Error {
        case invalid
    }
    
    var service: OtherUserService
    
    init(otherUserService: OtherUserService) {
        service = otherUserService
    }
    
    func login(userName: String,
               userPassword: String) throws {
        if let user = service.loadUser(userName: userName) {
            if user.getUserPassword() == userPassword {
                print("로그인 성공!")
                return
            }
        }
        throw LoginError.invalid
    }
}
