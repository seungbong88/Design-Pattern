//
//  AmericanoDecorator.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/13.
//

import Foundation

class AmericanoDecorator: Americano {

    var americano: Americano
    var name: String = "아메리카노"
    
    init(americano: Americano) {
        self.americano = americano
    }
    
    func cost() -> Int {
        return self.cost()
    }
    
    func printMenu() {
        americano.printMenu()
    }
}
