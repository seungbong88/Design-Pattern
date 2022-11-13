//
//  Hazelnut.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/13.
//

import Foundation

class HazelnutAmericanoDecorator: AmericanoDecorator {
    
    override init(americano: Americano) {
        super.init(americano: americano)
        self.name = "헤이즐넛 " + self.name
    }
    
    override func cost() -> Int {
        return self.americano.cost() + 500
    }
}
