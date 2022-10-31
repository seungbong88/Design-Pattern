//
//  Bag.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 2. Composite
class Bag: Component {
    private var items: [Component] = []
    
    func addItem(_ item: Component) {
        items.append(item)
    }
    
    func getPrice() -> Int {
        return items.reduce(0, { return $0 + $1.getPrice() })
    }
}
