//
//  CompositeApp.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

class CompositeApp {
    
    func start() {
        let bluePortion = Item(name: "파란물약", price: 60)
        let infinityGauntlet = Item(name: "인피니티 건틀릿", price: 200)
        
        let bag = Bag()
        bag.addItem(bluePortion)
        bag.addItem(infinityGauntlet)
        
        printPrice(component: bluePortion)
        printPrice(component: infinityGauntlet)
        printPrice(component: bag)
    }
    
    func printPrice(component: Component) {
        print(component.getPrice())
    }
}
