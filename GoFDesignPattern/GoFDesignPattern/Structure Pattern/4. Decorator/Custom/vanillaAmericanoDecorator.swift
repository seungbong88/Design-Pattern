//
//  vanillaAmericanoDecorator.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/13.
//

import Foundation

class VanillaAmericanoDecorator: AmericanoDecorator {
    
    override init(americano: Americano) {
        super.init(americano: americano)
        self.name = "바닐라 " + self.name
    }
    
    override func cost() -> Int {
        return self.americano.cost() + 600
    }
}
