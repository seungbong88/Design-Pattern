//
//  Character.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/20.
//

import UIKit

class Character {
    var value: String
    var color: UIColor
    var font: UIFont
    
    init(value: String, color: UIColor, font: UIFont) {
        self.value = value
        self.color = color
        self.font = font
    }
}
