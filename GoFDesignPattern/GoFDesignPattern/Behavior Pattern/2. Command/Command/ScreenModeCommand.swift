//
//  ScreenSettingCommand.swift
//  GoFDesignPattern
//
//  Created by seungbong on 2022/11/27.
//

import Foundation

// 4. Concrete Command
class ScreenSettingCommand: Command {
    private var screenSetting: ScreenSetting
    
    init(screenSetting: ScreenSetting) {
        self.screenSetting = screenSetting
    }
    
    func execute() {
        screenSetting.switchScreenMode()
    }
}
