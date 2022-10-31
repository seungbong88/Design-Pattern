//
//  Champion.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/10/31.
//

import Foundation

// 3. Implementor
class DefaultChampion: Champion {

    var name: String
    var skin: Skin
    var skillName: String = ""
    
    init(name: String, skin: Skin) {
        self.name = name
        self.skin = skin
    }
    
    func move() {
        print("\(name) \(skin.name) move")
    }
    
    func skillQ() {
        print("\(name) \(skin.name) \"\(skillName)\" Q")
    }
    
    func skillW() {
        print("\(name) \(skin.name) W")
    }
    
    func skillE() {
        print("\(name) \(skin.name) E")
    }
    
    func skillR() {
        print("\(name) \(skin.name) R")
    }
    
}
