//
//  LightOnOffCommand.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

// 4. Concrete Command
class LightOnOffCommand: Command {
    
    var light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        light.switchLightOnOff()
    }
}
