//
//  ProxyApp.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/20.
//

import Foundation

class ProxyApp {
    
    func start() {
        let gameService = ProxyGameService()
        gameService.startGame()
    }
}
