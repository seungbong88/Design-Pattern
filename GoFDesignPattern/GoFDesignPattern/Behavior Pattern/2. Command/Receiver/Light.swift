//
//  Light.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

// 2. Receiver
class Light {
    private var isOn: Bool = false
    
    func switchLightOnOff() {
        if self.isOn {
            lightOff()
        } else {
            lightOn()
        }
    }
    
    private func lightOn() {
        isOn = true
        print("불이 켜졌습니다.")
    }
    
    private func lightOff() {
        isOn = false
        print("불이 꺼졌습니다.")
    }
}
