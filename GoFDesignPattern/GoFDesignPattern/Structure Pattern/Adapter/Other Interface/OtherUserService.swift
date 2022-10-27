//
//  OtherUserServiceProtocol.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/27.
//

import Foundation

protocol OtherUserService {
    
    var allUsers: [OtherUser] { get set }
    
    /// 사용자 이름으로 검색해 사용자 정보를 불러오는 함수
    /// - Parameter userName: 사용자 이름
    /// - Returns: 해당하는 사용자가 있다면 정보를 리턴한다. 없다면 nil을 리턴한다.
    func loadUser(userName: String) -> OtherUser?
}
