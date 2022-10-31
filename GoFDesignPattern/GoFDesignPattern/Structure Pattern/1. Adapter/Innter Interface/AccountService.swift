//
//  AccountService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation

class AccountService {
    
    var accounts: [Account] = []
    
    ///  이름으로 계정 객체를 찾는 함수
    /// - Parameters:
    ///   - accounts: 전체 계정 목록
    ///   - userName:  사용자 이름
    /// - Returns: 사용자 이름과 동일한 계정, 존재하지 않는다면 nil을 리턴한다.
    func findAccountByUserName(userName: String) -> Account? {
        for account in accounts {
            if account.name == userName {
                return account
            }
        }
        return nil
    }
    
    /// 새로운 계정을 만드는 함수
    /// - Parameters:
    ///   - userName: 사용자 이름
    ///   - userPassword: 사용자 비밀번호
    ///   - userEmail: 사용자 이메일
    /// - Returns: 생성된 계정 객체
    func createNewAccount(userName: String,
                          userPassword: String,
                          userEmail: String) -> Account {
        return Account(name: userName,
                       password: userPassword,
                       email: userEmail)
    }
    
    /// 계정의 이메일을 변경하는 함수
    /// - Parameters:
    ///   - account: 사용자 계정
    ///   - newEmail: 변경할 이메일 주소
    /// - Returns: 이메일주소가 변경된 계정 객체
    func updateEmailToAccount(account: Account,
                              newEmail: String) -> Account {
        let newAccount = account
        newAccount.email = newEmail
        return newAccount
    }
}
