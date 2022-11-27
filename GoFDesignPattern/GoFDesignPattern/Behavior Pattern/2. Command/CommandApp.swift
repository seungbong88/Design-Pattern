//
//  CommandApp.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

class CommandApp {
    
    func start() {
        let lightButton = CustomButton(command: LightOnOffCommand(light: Light()))
        lightButton.buttonDidTap()
        lightButton.buttonDidTap()
        lightButton.buttonDidTap()
        lightButton.buttonDidTap()
        
        let screenSettingButton = CustomButton(command: ScreenSettingCommand(screenSetting: ScreenSetting()))
        screenSettingButton.buttonDidTap()
        screenSettingButton.buttonDidTap()
        screenSettingButton.buttonDidTap()
    }
}
