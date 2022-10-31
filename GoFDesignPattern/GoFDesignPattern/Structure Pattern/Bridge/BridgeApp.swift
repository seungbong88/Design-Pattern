//
//  BridgeApp.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

class BridgeApp {
    
    func start() {
        let zombieKaisa = 카이사(skin: ZombieSkin())
        let christmasNoonoo = 누누와윌럼프(skin: ChristmasSkin())
        print(christmasNoonoo.skillQ())
    }
}
