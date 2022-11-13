//
//  DefaultAmericano.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/13.
//

import Foundation

class DefaultAmericano: Americano {
    func cost() -> Int {
        return 3500
    }
    
    func printMenu() {
        print("아메리카노, 가격은 \(self.cost())원 입니다.")
    }
}
