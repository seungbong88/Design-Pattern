//
//  ProxyGameService.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

// 3. Proxy Subject
class ProxyGameService: GameService {
    var gameService: GameService?   // 인터페이스 타입에 대한 참조를 가진다.
    
    func startGame() {
        // 프록시패턴 - 이른 초기화(Eager Initialization) 사용
        if gameService == nil {
            gameService = RealGameService()
        }
        gameService!.startGame()
    }
}
