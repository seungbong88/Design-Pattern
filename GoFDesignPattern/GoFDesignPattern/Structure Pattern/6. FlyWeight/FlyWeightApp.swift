//
//  FlyWeightApp.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/13.
//

import UIKit

class FlyWeightApp {
    
    func start() {
        let fontFactory = FontFactory()
        let c1 = Character(value: "h", color: .black, font: fontFactory.getFont(name: "나눔", size: 12))
        let c2 = Character(value: "e", color: .red, font: fontFactory.getFont(name: "나눔", size: 12))
        let c3 = Character(value: "l", color: .blue, font: fontFactory.getFont(name: "나눔", size: 12))
        let c4 = Character(value: "l", color: .yellow, font: fontFactory.getFont(name: "나눔", size: 12))
        let c5 = Character(value: "5", color: .green, font: fontFactory.getFont(name: "나눔", size: 12))
    }
    
    func ASIS_start() {
        let c1 = Character(value: "h", color: .black, font: UIFont(name: "나눔", size: 12)!)
        let c2 = Character(value: "e", color: .red, font: UIFont(name: "나눔", size: 12)!)
        let c3 = Character(value: "l", color: .blue, font: UIFont(name: "나눔", size: 12)!)
        let c4 = Character(value: "l", color: .yellow, font: UIFont(name: "나눔", size: 12)!)
        let c5 = Character(value: "5", color: .green, font: UIFont(name: "나눔", size: 12)!)
    }
}
