//
//  Item.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 3. Leaf
class Item: Component {
    var name: String
    private var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func getPrice() -> Int {
        return self.price
    }
}
